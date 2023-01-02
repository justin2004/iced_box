FROM debian:11
RUN apt-get update && apt-get install -y leiningen git clojure
RUN apt-get install -y curl
#                                                      ^ needed for clojure CLI projects (deps.edn files i think)
WORKDIR /root

# this gets 'clj'
RUN curl -O https://download.clojure.org/install/linux-install-1.11.1.1200.sh && \
    chmod +x linux-install-1.11.1.1200.sh && \
    ./linux-install-1.11.1.1200.sh

RUN apt-get install -y openjdk-11-jdk

RUN git clone --depth=1 https://github.com/liquidz/vim-iced.git
WORKDIR /mnt
RUN apt-get install -y npm
#                     ^ for shadow cljs
# CMD /root/vim-iced/bin/iced repl --with-cljs
CMD /root/vim-iced/bin/iced repl

# docker run --net=host --rm -v iced_box_m2:/root/.m2 -v `pwd`:/mnt -it justin2004/iced_box
