FROM gcc:latest
WORKDIR /usr/src/
RUN apt-get update
RUN apt-get upgrade -y

# install ffmpeg
RUN apt-get -y install ffmpeg
RUN apt-get install -y cmake

# install opencv
RUN wget https://github.com/opencv/opencv/archive/refs/tags/4.9.0.zip
RUN unzip 4.9.0.zip
WORKDIR /usr/src/opencv-4.9.0
RUN mkdir -p build
WORKDIR /usr/src/opencv-4.9.0/build
RUN cmake ../ -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local 
RUN make 
RUN make install
RUN make clean

CMD ["/bin/bash"]