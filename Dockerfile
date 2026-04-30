FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
COPY styles.css /usr/share/nginx/html/styles.css
COPY favicon.ico /usr/share/nginx/html/favicon.ico
COPY favicon-32x32.png /usr/share/nginx/html/favicon-32x32.png
COPY favicon-192x192.png /usr/share/nginx/html/favicon-192x192.png
COPY favicon-512x512.png /usr/share/nginx/html/favicon-512x512.png
COPY apple-touch-icon.png /usr/share/nginx/html/apple-touch-icon.png
COPY imagenes /usr/share/nginx/html/imagenes

EXPOSE 8010

HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1:8010/ || exit 1
