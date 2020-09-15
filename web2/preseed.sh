cp /vagrant/web2/preseed.yaml config.yaml
cp /vagrant/haproxy/server.crt key.pem
sed -i '1d;$d' key.pem
export CERTI=$(sed ':a;N;$!ba;s/\n/\n\n/g' key.pem)
echo -ne '    -----BEGIN CERTIFICATE-----\n    ' >> config.yaml
echo $CERTI | sed 's/\s/\n    /g' >> config.yaml
echo -e '    -----END CERTIFICATE-----' >> config.yaml
echo -e '  cluster_password: admin' >> config.yaml
cat config.yaml