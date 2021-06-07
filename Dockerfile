FROM ghost:4.8.0-alpine as ghost
ENV database__client sqlite3
ENV mail__transport SMTP
ENV mail__options__service Mailgun

FROM jonasal/nginx-certbot:2-alpine as nginx
COPY nginx/*.conf /etc/nginx/conf.d/

FROM varnish:stable as cache
COPY varnish/default.vcl /etc/varnish/