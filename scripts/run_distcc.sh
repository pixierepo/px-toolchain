#!/bin/bash

#Export environment viariables
export PATH=/opt/x-tools7h/arm-unknown-linux-gnueabihf/bin:${PATH}
export LD_LIBRARY_PATH=/opt/gcc-libs/usr/lib

#Run distcc
exec distccd \
        --port 3632             				\
        --user distcc           				\
        --daemon                				\
        --no-detach             				\
        --verbose               				\
        --jobs ${DISTCCD_JOBS:-32}				\
        --listen 0.0.0.0        				\
        --allow ${DISTCCD_ALLOW:-0.0.0.0/0}		\
        --make-me-a-botnet						\
        --log-level info        				\
        --log-file /tmp/distccd.log