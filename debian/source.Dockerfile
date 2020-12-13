FROM debian:bullseye as build

ONBUILD ARG COBOL_SOURCE=https://downloads.sourceforge.net/project/gnucobol/gnucobol/3.1/gnucobol-3.1.1.tar.lz

RUN apt-get update && apt-get install -y \
    build-essential \
    libdb5.3 \
    libdb-dev \
    libgmp10 \
    libgmp-dev \
    libncurses5-dev \
    libncursesw5-dev \
    wget \
    lzip

RUN wget -O /var/cache/cobol/gnucobol.tar.lz $COBOL_SOURCE

USER cobol
WORKDIR /home/cobol

RUN mkdir /home/cobol
RUN tar --lzip -xf /var/cache/cobol/gnucobol.tar.lz -C /home/cobol --strip-components=1

RUN ./configure
RUN make
RUN make checkall
RUN make install

CMD cobc --help