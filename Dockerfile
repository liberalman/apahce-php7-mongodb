FROM docker.io/php:7.2-apache
MAINTAINER php-apache-mongodb <shouchao.zheng@nio.com>

env LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib/php/extensions/no-debug-non-zts-20170718/
ADD no-debug-non-zts-20170718/mongodb.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/mongodb.so
RUN ln -s /usr/local/lib/php/extensions/no-debug-non-zts-20170718/mongodb.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/mongodb.so.so
ADD libpthread.so.0 /lib64/libpthread.so.0
#ADD libssl.so.10 /lib64/libssl.so.10
ADD libssl.so.10 /usr/local/lib/php/extensions/no-debug-non-zts-20170718/libssl.so.10
ADD libcrypto.so.10 /usr/local/lib/php/extensions/no-debug-non-zts-20170718/libcrypto.so.10
ADD php.ini /usr/local/etc/php/php.ini

# docker build -t php-mongodb:7.2-apache .
# docker run -it --rm php-mongodb:7.2-apache /bin/sh
