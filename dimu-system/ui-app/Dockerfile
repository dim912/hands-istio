FROM nginx
WORKDIR /app
COPY app.sh /app/app.sh
RUN chmod 755 /app/app.sh
RUN apt-get -y update
RUN apt install curl
