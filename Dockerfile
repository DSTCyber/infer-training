FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV WORKDIR /root
WORKDIR ${WORKDIR}

RUN apt update
RUN apt install -y git build-essential autoconf clang libreadline-dev \
    libncurses-dev bison flex tzdata \
    libsdl2-dev libsdl2-mixer-dev libsdl2-ttf-dev libsdl2-image-dev \
    vim curl

# Get Infer
ADD https://github.com/facebook/infer/releases/download/v0.17.0/infer-linux64-v0.17.0.tar.xz . 
RUN tar xf infer-linux64-v0.17.0.tar.xz
RUN rm infer-linux64-v0.17.0.tar.xz

ENV PATH "/root/infer-linux64-v0.17.0/bin/:${PATH}"
ENV LD_LIBRARY_PATH "/root/infer-linux64-v0.17.0/lib/:${LD_LIBRARY_PATH}"
ENV MANPATH "/root/infer-linux64-v0.17.0/man/:${MANPATH}"
ENV CC "clang"
ENV CXX "clang++"

# change to shared directory with host
# RUN mkdir lab 
# WORKDIR ${WORKDIR}/lab

# Get skynet
#RUN git clone https://github.com/cloudwu/skynet skynet && \
#    cd skynet && git checkout a6293f27cd08cbe33b5dc99b561e54659d544d54

# Get bsdgames
#RUN git clone https://github.com/vattam/BSDGames bsdgames && \
#    cd bsdgames && git checkout 56b8944332186891cd5c0094bd3991e3c5f5a799
#RUN mkdir -p bsdgames/temp-dictionary && touch bsdgames/temp-dictionary/words
#RUN grep -rl getline bsdgames/ | xargs sed -i 's/getline/bog_getline/g'

# Get angband
#ADD http://rephial.org/downloads/4.2/angband-4.2.0.tar.gz .
#RUN tar xf angband-4.2.0.tar.gz
#RUN rm angband-4.2.0.tar.gz
#RUN cd angband-4.2.0 && ./autogen.sh
