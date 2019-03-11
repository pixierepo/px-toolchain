# px-toolchain
Dockerfile and scripts for a distcc &amp; cross compilation container based on Arch Linux. Based on the multi-architecture images from [archlinux-docker](https://github.com/lopsided98/archlinux-docker).

## Building and running the image:
Image for x86_64 is available in [Dockerhub](https://hub.docker.com/r/pxtech/px-toolchain).

To pull and run the image execute the command below:

```
docker run  -d                          \
            --rm                        \
            -p 3632:3632                \
            -p 3633:3633                \
            -e DISTCCD_JOBS=32          \
            -e DISTCCD_ALLOW=0.0.0.0/0  \
            -e TZ=America/Los_Angeles   \
            --name px-toolchain         \
            pxtech/px-toolchain
```

### Options:
```
-d: Run in detached mode.
--rm: Remove container on exit.
-p: Exposes ports 3632 (distcc) and 3633 (distcc stats)
--name: Name of container.

Environment Variables:
DISTCCD_JOBS: Number of jobs to run (32 by default)
DISTCCD_ALLOW: Listen to any host.
TZ: Timezone.

Note: Distcc --make-me-a-botnet option is enabled by default. To remove this option edit '/scripts/run_distcc.sh'.
```

If you prefer to build the image yourself, run:
```
docker build -f Dockerfile.px-toolchain .
```
## References:

[archlinux-docker:](https://github.com/lopsided98/archlinux-docker) - Basic Arch Linux Docker images for multiple architectures build with native pacman and Docker multi-stage builds.

[Archlinux ARM Distcc Cross-Compiling](https://archlinuxarm.org/wiki/Distcc_Cross-Compiling) - Toolchain is used as provided by Arch Linux ARM.
