# iced box

## what 

[vim-iced](https://github.com/liquidz/vim-iced) (server side) in a docker container

## why

so you can quickly start using a clojure REPL on a project without needing to install the server side of vim-iced locally

## how

- put this in your bashrc

```
alias icedbox='docker run --net=host --rm -v iced_box_m2:/root/.m2 -v `pwd`:/mnt -it justin2004/iced_box'
```

- `make`
- cd to a directory with a clojure project
- `icedbox`
- then, with vim in that directory, connect with vim-iced   e.g. `:IcedConnect`

