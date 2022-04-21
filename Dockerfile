FROM debian:11
RUN apt-get update && apt-get install -y leiningen git
WORKDIR /root
RUN git clone --depth=1 https://github.com/liquidz/vim-iced.git
WORKDIR /mnt
CMD /root/vim-iced/bin/iced repl

# docker run --net=host --rm -v iced_box_m2:/root/.m2 -v `pwd`:/mnt -it justin2004/iced_box
