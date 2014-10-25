install_linux_manpages() {
    pushd
    cd `mktemp -dt tmp`
    mkdir man-pages
    git clone http://git.kernel.org/pub/scm/docs/man-pages/man-pages
    cd man-pages
    for f in man?/**/*.?; do mv -v $f `dirname $f`/linux.`basename $f`; done
    sudo make install
    popd
    rm -rf man-pages
    popd
}
