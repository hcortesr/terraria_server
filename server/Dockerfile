FROM node:22.18-bookworm

WORKDIR /root/terra

COPY . .

CMD ["bash", "-c", "./autoRunServer.sh | ./TerrariaServer.bin.x86_64 -config config.txt"]