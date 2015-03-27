if [[ -x "`which boot2docker`" ]]; then
    $(boot2docker shellinit 2>/dev/null)

    alias lsdocker='docker images'
    alias psdocker='docker ps -a -q'
    alias killalldocker='docker stop `psdocker`'
    alias rmalldocker='docker rm `psdocker`'
    alias startdocker='boot2docker start && `boot2docker shellinit 2>/dev/null`'

    portdocker() {
        MACHINENAME="boot2docker-vm"
        __portdocker_map() {
            echo "mapping $1 ..."
            VBoxManage controlvm $MACHINENAME natpf1 "tcp-port$1,tcp,,$1,,$1"
            VBoxManage controlvm $MACHINENAME natpf1 "udp-port$1,udp,,$1,,$1"
        }

        __portdocker_del() {
            echo "deleting $1 ..."
            VBoxManage controlvm $MACHINENAME natpf1 delete "tcp-port$1"
            VBoxManage controlvm $MACHINENAME natpf1 delete "udp-port$1"
        }

        case $1 in
            list)
                VBoxManage showvminfo $MACHINENAME | grep --color=never -E 'NIC \d+ Rule' | ruby -pe "gsub /^NIC \d+ Rule.*:\s*/, ''"
                ;;
            map)
                test -z "$2" && echo "$0 map from-port [to-port]" && return 2
                if [[ -n "$3" ]]; then
                    for i in {$2..$3}; do
                        __portdocker_map $i
                    done
                else
                    __portdocker_map $2
                fi
                ;;
            del)
                test -z "$2" && echo "$0 del from-port [to-port]" && return 2
                if [[ -n "$3" ]]; then
                    for i in {$2..$3}; do
                        __portdocker_del $i
                    done
                else
                    __portdocker_del $2
                fi
                ;;
            *)
                echo "$0 list | map | del" 1>&2
                return 1
                ;;
        esac
    }
fi
