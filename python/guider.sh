#--------- for Linux --------- #
PYTHONHOME="${0%/*}"
[ -f $PYTHONHOME/guider.pyc ] && GUIDER=$PYTHONHOME/guider.pyc
[ -z $GUIDER ] && [ -f $PYTHONHOME/guider.py ] && GUIDER=$PYTHONHOME/guider.py
LD_LIBRARY_PATH=$PYTHONHOME/lib PYTHONPATH=$PYTHONHOME:$PYTHONHOME/lib $PYTHONHOME/bin/python $GUIDER "$@"

exit

#--------- for Android --------- #
export PYHOME=$PWD/$(dirname $0)

export PATH=$PATH:$PYHOME/usr/bin

if [ ! -z "$LD_LIBRARY_PATH" ] ; then
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:"
fi

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH$PYHOME/usr/lib"
#export SSL_CERT_FILE="$PYHOME/etc/ssl/cert.pem"

# For ncurses
export TERMINFO="$PYHOME/usr/share/terminfo"
export HOME=/data/local/tmp

python3 $PYHOME/guider.py $@
