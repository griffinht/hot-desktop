FROM debian as build

ARG HOST

COPY ./hot-desktop/ hot-desktop/
COPY ./preseed preseed
COPY ./http/build.sh http/build.sh
RUN ./http/build.sh $HOST

FROM nginx

COPY --from=build /html/ /usr/share/nginx/html/