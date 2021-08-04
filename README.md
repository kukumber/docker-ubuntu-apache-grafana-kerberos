Grafana with apache reverse-proxy container and Kerberos authentication enabled.


# Building the container
```
docker build -t <apache_krb_image_tag> . 
```

# Running docker-compose
Substitute all the dummy angle brackets variables in the docker-compose.yml file and all configuration files. Run:
```
docker-compose up -d
```

# Generating a keytab file
One can generate a keytab file using a `ktpass` utility: 

```
ktpass -princ HTTP/server.domain.com@DOMAIN.CON -mapuser service_account@DOMAIN.COM -pass * -crypto All -ptype KRB5_NT_PRINCIPAL -out file.keytab 
```

# Useful links
**mod_auth_gssapi**<br>
[https://github.com/gssapi/mod_auth_gssapi](https://github.com/gssapi/mod_auth_gssapi)

**mod_authnz_ldap**<br>
[https://httpd.apache.org/docs/2.4/mod/mod_authnz_ldap.html](https://httpd.apache.org/docs/2.4/mod/mod_authnz_ldap.html)
