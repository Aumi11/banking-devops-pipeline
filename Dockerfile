FROM alpine AS builder
WORKDIR /build
COPY app/ ./

FROM nginx:alpine	

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx","-g","daemon off;"]
