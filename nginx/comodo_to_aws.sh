#!/bin/bash

# SSL certificate setup: from COMODO to AWS ACM

## Amazon AWS need your issued certificatey, your private key and thhe chain
## certificate bundle that include all intermediate and Root CA certificate.

## Comodo send you 4 certificates: AddTrustExternalCARoot.crt, <your_fqdn>.crt,
## COMODORSAAddTrustCA.crt and COMODORSADomainValidationSecureServerCA.crt
## (the latter may vary depending on your certificate type)

## Rename your CRT and private key like: mydomain_com
NAME=$1

echo "Creating a work folder..."
mkdir pem;

echo "Converting all certificates..."
openssl x509 -in ./AddTrustExternalCARoot.crt -outform pem -out ./pem/AddTrustExternalCARoot.pem
openssl x509 -in ./COMODORSAAddTrustCA.crt -outform pem -out ./pem/COMODORSAAddTrustCA.pem
openssl x509 -in ./COMODORSADomainValidationSecureServerCA.crt -outform pem -out ./pem/COMODORSADomainValidationSecureServerCA.pem
openssl x509 -in ./$NAME.crt -outform pem -out ./pem/$NAME.pem

echo "Converting the private key..."

openssl rsa -in ./$NAME.key -outform PEM -out ./pem/$NAME.key.pem

echo "Creating a certificate chain bundle..."

cat ./pem/COMODORSADomainValidationSecureServerCA.pem > ./pem/CAChain.pem
cat ./pem/COMODORSAAddTrustCA.pem >> ./pem/CAChain.pem
cat ./pem/AddTrustExternalCARoot.pem >> ./pem/CAChain.pem

echo "----"
echo "AWS ACM Import certificate tips (macOS):"

echo "Certificate body:"
echo "cat ./pem/{$NAME}.pem |pbcopy"

echo "Certificate private key:"
echo "cat ./pem/{$NAME}.key.pem |pbcopy"

echo "Certificate chain (optional):"
echo "cat ./pem/CAChain.pem |pbcopy"

echo "Thanks."
