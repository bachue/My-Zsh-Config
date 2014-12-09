sshtunnel() {
    OPTIND=1
    PROGRAM=$0

    # Common default parameters
    PROXY_USER=`whoami`
    PROXY_SSH_PORT=22
    MONITOR_PORT=18524
    PROXY_PORT=8080

    case "$1" in
        send)
            shift
            ACTION=send
            LOCAL_PORT=18525
            ;;
        recv)
            shift
            ACTION=recv
            ;;
        *)
            echo "Usage: $PROGRAM send | recv [options...]"
            return
            ;;
    esac

    while : ; do
      case "$1" in
        --proxy-host)
            PROXY_HOST="$2"
            shift 2
            ;;
        --proxy-port)
            PROXY_PORT="$2"
            shift 2
            ;;
        --proxy-user)
            PROXY_USER="$2"
            shift 2
            ;;
        --proxy-port)
            PROXY_SSH_PORT="$2"
            shift 2
            ;;
        --local-port)
            LOCAL_PORT="$2"
            shift 2
            ;;
        --monitor-port)
            MONITOR_PORT="$2"
            shift 2
            ;;
        -i)
            IDENTIFY_FILE="-i $2"
            shift 2
            ;;
        "")
            break
            ;;
        *)
            if [ "$ACTION" = "recv" ]; then
                echo "Usage: $PROGRAM recv [options...]"
                echo "    --proxy-host       Hostname of the proxy ssh server. Required."
                echo "    --proxy-port       Port of the proxy ssh server to be listened. Default: 8080."
                echo "    --proxy-user       User on the proxy ssh server to login."
                echo "    --proxy-ssh-port   Port of the proxy ssh server, default: 22."
                echo "    --local-port       Port of the local server to forward to. Required."
                echo "    --monitor-port     Port of the local server to monitor the connection, only need for autossh, default: 18524."
                echo "    -i                 Selects a file from which the identity (private key) for public key authentication is read."
                return
            elif [ "$ACTION" = "send" ]; then
                echo "Usage: $PROGRAM send [options...]"
                echo "    --proxy-host       Hostname of the proxy ssh server. Required."
                echo "    --proxy-port       Port of the proxy ssh server to forward to. Default: 8080."
                echo "    --proxy-user       User on the proxy ssh server to login."
                echo "    --proxy-ssh-port   Port of the proxy ssh server, default: 22."
                echo "    --local-port       Port of the local server to be listened. Default: 18525."
                echo "    --monitor-port     Port of the local server to monitor the connection, only need for autossh, default: 18524."
                echo "    -i                 Selects a file from which the identity (private key) for public key authentication is read."
                return
            fi
      esac
    done

    if [ -z "$PROXY_USER" ] || [ -z "$PROXY_HOST" ] || [ -z "$PROXY_PORT" ] || [ -z "$LOCAL_PORT" ] || [ -z "$PROXY_SSH_PORT" ] || [ -z "$MONITOR_PORT" ]; then
        $PROGRAM $ACTION --help
        return
    fi;

    AUTOSSH_OPTS="-f -M $MONITOR_PORT $IDENTIFY_FILE -p $PROXY_SSH_PORT -o 'ServerAliveInterval 15' -o 'ServerAliveCountMax 3'"
    SSH_OPTS="$IDENTIFY_FILE -p $PROXY_SSH_PORT"

    if [ "$ACTION" = "recv" ]; then
        if [ -x "`which autossh`" ]; then
            COMMAND="autossh $AUTOSSH_OPTS -CNR $PROXY_PORT:localhost:$LOCAL_PORT"
        elif [ -x "`which ssh`" ]; then
            COMMAND="ssh $SSH_OPTS -CNfR $PROXY_PORT:localhost:$LOCAL_PORT"
        fi
    elif [ "$ACTION" = "send" ]; then
        if [ -x "`which autossh`" ]; then
            COMMAND="autossh $AUTOSSH_OPTS -CNL $LOCAL_PORT:localhost:$PROXY_PORT"
        elif [ -x "`which ssh`" ]; then
            COMMAND="ssh $SSH_OPTS -CNfL $LOCAL_PORT:localhost:$PROXY_PORT"
        fi
    fi
    eval "$COMMAND $PROXY_USER@$PROXY_HOST"
    RET=$?
    if [ "$RET" = "0" ]; then
        if [ "$ACTION" = "recv" ]; then
            echo "sshtunnel to localhost:$LOCAL_PORT opened, now run command \`$PROGRAM send --proxy-host $PROXY_HOST --proxy-port $PROXY_PORT --proxy-user $PROXY_USER --proxy-ssh-port $PROXY_SSH_PORT $IDENTIFY_FILE\` to connect to it."
        elif [ "$ACTION" = "send" ]; then
            echo "sshtunnel to $PROXY_HOST:$PROXY_PORT opened, any data send to localhost:$LOCAL_PORT will be forward to it."
        fi
    fi
    return $RET
}
