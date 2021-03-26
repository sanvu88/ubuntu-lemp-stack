#!/bin/bash

######################################################################
#           Auto Install & Optimize LEMP Stack on Ubuntu             #
#                                                                    #
#                Author: Sanvv - HOSTVN Technical                    #
#                  Website: https://hostvn.vn                        #
#                                                                    #
#              Please do not remove copyright. Thank!                #
#  Please do not copy under any circumstance for commercial reason!  #
######################################################################

apt-get install build-essential zlib1g-dev libpcre3 libpcre3-dev unzip uuid-dev -y

UPDATE_LINK="https://scripts.hostvn.net/ubuntu/update"
MODULE_PATH="/usr/share/nginx_module"
mkdir -p "${MODULE_PATH}"
NGINX_VERSION=$(curl -s ${UPDATE_LINK}/version | grep "nginx_version=" | cut -f2 -d'=')
NPS_VERSION=$(curl -s ${UPDATE_LINK}/version | grep "nps_version=" | cut -f2 -d'=')
ngx_cache_purge_version=$(curl -s ${UPDATE_LINK}/version | grep "ngx_cache_purge_version=" | cut -f2 -d'=')
more_clear_headers_v=$(curl -s ${UPDATE_LINK}/version | grep "more_clear_headers_v=" | cut -f2 -d'=')
openssl_version=$(curl -s ${UPDATE_LINK}/version | grep "openssl_version=" | cut -f2 -d'=')
pcre_version=$(curl -s ${UPDATE_LINK}/version | grep "pcre_version=" | cut -f2 -d'=')
zlib_version=$(curl -s ${UPDATE_LINK}/version | grep "zlib_version=" | cut -f2 -d'=')

cd "${MODULE_PATH}" || exit

rm -rf "${MODULE_PATH:?}"/*

wget -O- https://github.com/apache/incubator-pagespeed-ngx/archive/v"${NPS_VERSION}".tar.gz | tar -xz
nps_dir=$(find . -name "*pagespeed-ngx-${NPS_VERSION}" -type d)
cd "$nps_dir" || exit
NPS_RELEASE_NUMBER=${NPS_VERSION/beta/}
NPS_RELEASE_NUMBER=${NPS_VERSION/stable/}

psol_url=https://dl.google.com/dl/page-speed/psol/${NPS_RELEASE_NUMBER}.tar.gz
[ -e scripts/format_binary_url.sh ] && psol_url=$(scripts/format_binary_url.sh PSOL_BINARY_URL)
wget -O- "${psol_url}" | tar -xz

cd "${MODULE_PATH}" || exit
wget -O- http://nginx.org/download/nginx-"${NGINX_VERSION}".tar.gz | tar -xz
wget -O- http://scripts.hostvn.net/ubuntu/modules/ngx_cache_purge-"${ngx_cache_purge_version}".tar.gz | tar -xz
wget -O- http://scripts.hostvn.net/ubuntu/modules/openssl-OpenSSL_"${openssl_version}".tar.gz | tar -xz
wget -O- ftp://ftp.pcre.org/pub/pcre/pcre-"${pcre_version}".tar.gz | tar -xz
wget -O- https://www.zlib.net/zlib-"${zlib_version}".tar.gz | tar -xz
wget -O- http://scripts.hostvn.net/ubuntu/modules/headers-more-nginx-module-"${more_clear_headers_v}".tar.gz | tar -xz

git clone --depth 1 https://github.com/google/ngx_brotli
cd ngx_brotli && git submodule update --init

cd "${MODULE_PATH}"/nginx-"${NGINX_VERSION}"/ || exit
./configure \
    "--user=nginx" \
    "--group=nginx" \
    "--prefix=/usr" \
    "--sbin-path=/usr/sbin" \
    "--conf-path=/etc/nginx/nginx.conf" \
    "--pid-path=/var/run/nginx.pid" \
    "--http-log-path=/var/log/nginx/access_log" \
    "--error-log-path=/var/log/nginx/error_log" \
    "--without-mail_imap_module" \
    "--without-mail_smtp_module" \
    "--with-http_ssl_module" \
    "--with-http_realip_module" \
    "--with-http_stub_status_module" \
    "--with-http_gzip_static_module" \
    "--with-http_dav_module" \
    "--with-http_v2_module" \
    "--with-pcre=../pcre-${pcre_version}" \
    "--with-pcre-jit" \
    "--with-zlib=../zlib-${zlib_version}" \
    "--with-openssl=../openssl-OpenSSL_${openssl_version}" \
    "--with-openssl-opt=no-nextprotoneg" \
    "--add-module=../ngx_cache_purge-${ngx_cache_purge_version}" \
    "--add-module=../incubator-pagespeed-ngx-${NPS_VERSION}" \
    "--add-module=../headers-more-nginx-module-${more_clear_headers_v}" \
    "--add-module=../ngx_brotli" \
    "--with-cc-opt='-D FD_SETSIZE=32768'"

make && make install
