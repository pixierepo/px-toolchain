#!/bin/bash

docker run  -d                          \
            --rm                        \
            -p 3632:3632                \
            -p 3633:3633                \
            -e DISTCCD_JOBS=32          \
            -e DISTCCD_ALLOW=0.0.0.0/0  \
            -e TZ=America/Los_Angeles   \
            --name px-toolchain         \
            pxtech/px-toolchain
