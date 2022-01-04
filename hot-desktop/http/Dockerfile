FROM debian as build

ARG HOST
ARG ADDRESS

COPY ./hot-desktop/ hot-desktop/
COPY ./preseed preseed
COPY ./http/build.sh http/build.sh
RUN ./http/build.sh $HOST $ADDRESS

FROM nginx

COPY --from=build /html/ /usr/share/nginx/html/