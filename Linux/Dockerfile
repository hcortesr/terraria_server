FROM ubuntu:20.04

WORKDIR /root/terra

COPY . .

RUN ./TerrariaServer.bin.x86_64 -config config.txt

CMD ["bash"]