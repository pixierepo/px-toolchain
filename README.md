# px-toolchain
Docker image for distcc &amp; cross compilation for ARMv7 based on Arch Linux, originally created as part of [PX:Tech](https://www.pxtech.io) ecosystem. 

Built using the multi-architecture images from [archlinux-docker](https://github.com/lopsided98/archlinux-docker).

## Building and running the image
Image for x86_64 is available in [Dockerhub](https://hub.docker.com/r/pxtech/px-toolchain). A new image build is triggered whenever a change in the base image occurs.

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

### Options
```
-d: Run in detached mode.
--rm: Remove container on exit.
-p: Exposes ports 3632 (distcc) and 3633 (distcc stats)
--name: Name of container.

Environment Variables:
DISTCCD_JOBS: Number of jobs to accept and run (32 by default).
DISTCCD_ALLOW: Listen to any host.
TZ: Timezone.

Note: Distcc --make-me-a-botnet option is enabled by default. To remove this option edit '/scripts/run_distcc.sh'.
```

If you prefer to build the image yourself, run:
```
docker build -f Dockerfile.px-toolchain .
```

## Usage

Just run the container and set the Master system according to the [Distributed Compiling](https://archlinuxarm.org/wiki/Distributed_Compiling) entry on Arch Linux ARM Wiki.
This is where you'll be running ```makepkg``` from:

1. Install distcc.
2. Edit ```/etc/makepkg.cong``` file and change the following variables:
```
BUILDENV=(distcc color !ccache check !sign) # Enable distcc option

DISTCC_HOSTS="YOUR.CLIENT.IP.ADDR/JOBS"     # Enter the IP of the host that is running the container and the maximun number of                                             # jobs (Note that the default is 4 jobs).

MAKEFLAGS="-j32"                            # Maximum number of jobs to distribute.                                          
```

After this, you can run ```makepkg``` as you normally would.
To monitor progress and distribution of jobs, run:
```
watch -n 1 distccmon-text
```

## References

[archlinux-docker](https://github.com/lopsided98/archlinux-docker) - Basic Arch Linux Docker images for multiple architectures build with native pacman and Docker multi-stage builds.

[Archlinux ARM Distcc Cross-Compiling](https://archlinuxarm.org/wiki/Distcc_Cross-Compiling) - Toolchain is used as provided by Arch Linux ARM.

[PX:Tech](https://pxtech.io) - LTE-enabled Hardware, OS & Cloud platform for Industrial IoT applications.
