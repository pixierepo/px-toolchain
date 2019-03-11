FROM lopsided/archlinux:devel

LABEL maintainer="Jose Ruiz jose.ruiz@codeandmodules.com"

#Copy installation and configuration scripts:
COPY scripts/* /scripts/
RUN sh -x /scripts/quick-conf.sh
RUN sh -x /scripts/install_packages.sh
RUN sh -x /scripts/install_toolchain.sh

#Create user to run without root priviledges
RUN groupadd pxuser && \
    useradd -r -m -g pxuser -g wheel pxuser

USER pxuser

#Expose distcc ports:
EXPOSE 3932
EXPOSE 3933

ENTRYPOINT /bin/bash -x /scripts/run_distcc.sh
