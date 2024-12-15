FROM nginx:latest

ENV SSL_DIR=/etc/nginx/ssl \
    SSL_COUNTRY=US \
    SSL_STATE=State \
    SSL_CITY=City \
    SSL_ORGANIZATION=Organization \
    SSL_ORG_UNIT=OrgUnit \
    SSL_COMMON_NAME=localhost

RUN mkdir -p $SSL_DIR

# Step 1: Generate a CA (Certificate Authority)
RUN openssl genrsa -out $SSL_DIR/ca.key 2048 && \
    openssl req -x509 -new -nodes -key $SSL_DIR/ca.key -sha256 -days 365 \
    -subj "/C=$SSL_COUNTRY/ST=$SSL_STATE/L=$SSL_CITY/O=$SSL_ORGANIZATION/CN=LocalDevRootCA" \
    -out $SSL_DIR/ca.crt

# Step 2: Generate SSL key and certificate signing request (CSR) for Nginx
RUN openssl genrsa -out $SSL_DIR/self-signed.key 2048 && \
    openssl req -new -key $SSL_DIR/self-signed.key \
    -subj "/C=$SSL_COUNTRY/ST=$SSL_STATE/L=$SSL_CITY/O=$SSL_ORGANIZATION/OU=$SSL_ORG_UNIT/CN=$SSL_COMMON_NAME" \
    -out $SSL_DIR/self-signed.csr

# Step 3: Sign the certificate using the CA
RUN openssl x509 -req -in $SSL_DIR/self-signed.csr -CA $SSL_DIR/ca.crt -CAkey $SSL_DIR/ca.key \
    -CAcreateserial -out $SSL_DIR/self-signed.crt -days 365 -sha256

# Copy Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose HTTP and HTTPS ports
EXPOSE 80 443

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
