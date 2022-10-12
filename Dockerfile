ARG BUILD_FROM
FROM $BUILD_FROM
WORKDIR /usr/src

RUN apk update --no-cache \
	&& apk add \
		autoconf \
		cmake \
		dpkg-dev \
		gcc make \
		git \
		g++ \
		libc-dev \
		librtlsdr-dev \
		libtool \
		libusb-dev \
		rtl-sdr \
	&& git clone https://github.com/merbanan/rtl_433.git \
	&& mkdir -p  "rtl_433/build" \
	&& cd rtl_433/build \
	&& cmake \
        	-DCMAKE_INSTALL_PREFIX:PATH=/usr/local \
        	-DHAVE_LINUX_API=1 \
        	.. \
	&& make \
	&& make install \
    	&& rm -rf /usr/src/*
# Copy data
WORKDIR /
COPY rootfs /
#CMD [ "run" ]
