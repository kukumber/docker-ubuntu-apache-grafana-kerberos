FROM ubuntu/apache2:2.4-20.04_edge

# setup the timezone
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /var/krb5/security/creds/ \
  && apt-get update -y \
  && apt-get install -y --no-install-recommends \
     apache2 \
     ca-certificates \
     libapache2-mod-auth-gssapi

# enable apache modules
RUN a2enmod proxy_http ldap authnz_ldap

EXPOSE 80 443

CMD ["apache2-foreground"]
