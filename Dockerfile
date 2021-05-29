FROM nimlang/nim:latest
RUN apt-get update && apt-get install -y zsh gcc
RUN chsh -s /bin/zsh
