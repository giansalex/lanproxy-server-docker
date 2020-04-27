FROM maven:3.6-alpine as build

WORKDIR /lanproxy

RUN apk add --no-cache git
RUN git clone --depth 1 https://github.com/ffay/lanproxy.git ./

RUN mvn compile package -pl proxy-server -am 

RUN cd distribution && DIR_NAME=$(echo `ls` | awk '{print $NF}') && mv $DIR_NAME /lanproxy/lanproxy-server


FROM alpine:3.11

WORKDIR /lanproxy
EXPOSE 8090 4900 4993

RUN apk add --no-cache openjdk8-jre
COPY --from=build /lanproxy/lanproxy-server ./

CMD ["sh", "-c", "sh bin/startup.sh && tail -f logs/server.log"]