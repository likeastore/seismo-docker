# Docker file

FROM    mongodb/mongodb

# Git
RUN apt-get install -y git

# NodeJS
RUN apt-get update --fix-missing && apt-get upgrade -y
RUN apt-get install -y wget curl build-essential patch git-core openssl libssl-dev unzip ca-certificates
RUN curl http://nodejs.org/dist/v0.10.22/node-v0.10.22-linux-x64.tar.gz | tar xzvf - --strip-components=1 -C "/usr"
RUN apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Seismo
RUN git clone https://github.com/seismolabs/seismo-server.git /home/seismo
RUN cd /home/seismo; npm install
ENV PORT 8080
EXPOSE 8080
CMD ["node", "/home/seismo/app.js"]