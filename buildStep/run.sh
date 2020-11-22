docker build -t franky-ms-api-gateway821 .
docker rm -f franky-ms-api-gateway821 | true
docker run --name franky-ms-api-gateway821 --env application-name=ms-api-gateway --env instance-id=api-gateway-1 -d --memory 256MB --restart=always -p 46557:46557 franky-ms-api-gateway821
