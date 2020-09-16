FROM node:12-buster-slim

WORKDIR /app

RUN apt-get update --fix-missing && apt-get -y upgrade && apt-get install -y git wget gnupg && apt-get clean

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update \
    && apt-get install -y google-chrome-stable --no-install-recommends \
    && apt-get clean
RUN sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --no-sandbox/g' /opt/google/chrome/google-chrome

