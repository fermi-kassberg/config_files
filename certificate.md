# 1.生成私钥
$ openssl genrsa -out server1.key 2048

# 2.生成 CSR (Certificate Signing Request)
$ openssl req -subj "/C=CN/ST=Tianjin/L=Tianjin/O=Mocha/OU=Mocha Software/CN=rancherserver.mshome.net/emailAddress=test@mochasoft.com.cn" -new -key server1.key -out server1.csr

# 3.生成自签名证书
$ openssl x509 -req -days 3650 -in server1.csr -signkey server1.key -out server1.crt


# 1.创建 CA 私钥
$ openssl genrsa -out ca.key 2048

# 2.生成 CA 的自签名证书
$ openssl req -subj "/C=CN/ST=Tianjin/L=Tianjin/O=Mocha/OU=Mocha Software/CN=Server CA/emailAddress=test@mochasoft.com.cn" -new -x509 -days 3650 -key ca.key -out ca.crt

# 3.生成需要颁发证书的私钥
$ openssl genrsa -out server.key 2048

# 4.生成要颁发证书的证书签名请求，证书签名请求当中的 Common Name 必须区别于 CA 的证书里面的 Common Name
$ openssl req -subj "/C=CN/ST=Tianjin/L=Tianjin/O=Mocha/OU=Mocha Software/CN=rancherserver.mshome.net/emailAddress=test@mochasoft.com.cn" -new -key server.key -out server.csr

# 5.用 2 创建的 CA 证书给 4 生成的 签名请求 进行签名
$ openssl x509 -req -days 3650 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt
