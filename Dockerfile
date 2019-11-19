FROM haskell:8.6.5

RUN apt-get update && apt-get install libicu-dev libtinfo-dev libgmp-dev
RUN stack upgrade

RUN git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules

RUN sed -i "s|lts-13.18|lts-13.30|" haskell-ide-engine/install/shake.yaml
RUN sed -i "s|shake == 0.17.8|shake == 0.17.9|" haskell-ide-engine/install/hie-install.cabal
RUN cd haskell-ide-engine && stack ./install.hs hie-8.6.5
RUN cd haskell-ide-engine && stack ./install.hs build-data

