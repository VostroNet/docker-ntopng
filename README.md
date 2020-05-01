# vostro/ntopng

## Introduction
ntopng is the next generation version of the original ntop, a network traffic probe that shows the network usage, similar to what the popular top Unix command does. ntopng is based on libpcap and it has been written in a portable way in order to virtually run on every Unix platform, MacOSX and on Windows as well.

ntopng users can use a a web browser to navigate through ntop (that acts as a web server) traffic information and get a dump of the network status. In the latter case, ntopng can be seen as a simple RMON-like agent with an embedded web interface. 

http://www.ntop.org/products/traffic-analysis/ntop/

## Deployment

### Ports
 - 3000/TCP

### Command Line

Maxmind env variables are optional, only if you want geolocation to work in ntopng

 ```
docker run -d --restart=unless-stopped -p 3000:3000 \
  -e MAXMIND_ACCOUNT_ID=1234
  -e MAXMIND_LICENSE_KEY=1234
  -e MAXMIND_EDITIONS=GeoLite2-ASN GeoLite2-City GeoLite2-Country
  --link redis:redis vostro/ntopng /entrypoint.sh <ntopng arguments>
 ```
