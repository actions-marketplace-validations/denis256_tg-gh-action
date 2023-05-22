FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    git \
    jq \
    unzip \
    wget \
    awscli \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
RUN echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile

RUN git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv
RUN echo 'export PATH="$HOME/.tgenv/bin:$PATH"' >> ~/.bash_profile

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]