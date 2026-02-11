FROM debian:12
RUN apt-get update && apt-get install -y leiningen git clojure openjdk-17-jdk npm curl
#                                                                             ^ for shadow cljs
#                                                      ^ needed for clojure CLI projects (deps.edn files i think)
WORKDIR /root
USER root

ARG uid=1000
ARG gid=1000
ARG user=containeruser
RUN groupadd -g $gid $user || true
RUN useradd $user --uid $uid --gid $gid --home-dir /home/$user && \
    mkdir /home/$user && \
    chown $uid:$gid /home/$user

# this gets 'clj'
RUN curl -O https://download.clojure.org/install/linux-install-1.11.1.1200.sh && \
    chmod +x linux-install-1.11.1.1200.sh && \
    ./linux-install-1.11.1.1200.sh

USER $user
WORKDIR /home/$user
RUN mkdir -p /home/$user/.m2

RUN git clone --depth=1 https://github.com/liquidz/vim-iced.git


# CMD /root/vim-iced/bin/iced repl --with-cljs
# CMD /root/vim-iced/bin/iced repl
WORKDIR /mnt
CMD /home/containeruser/vim-iced/bin/iced repl # TODO i had to bake 'containeruser' in here

# docker build --build-arg=uid=`id -u` --build-arg=gid=`id -g` -t justin2004/iced_box .
# docker run --user=`id -u`:`id -u` --net=host --rm -v iced_box_m2:/root/.m2 -v `pwd`:/mnt -it justin2004/iced_box
