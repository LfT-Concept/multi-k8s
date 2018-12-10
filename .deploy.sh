docker build -t lftconcept/multi-client -f ./client/Dockerfile ./client
docker build -t lftconcept/multi-server -f ./server/Dockerfile ./server
dokcer build -t lftconcept/multi-worker -f ./worker/Dockerfile ./worker
docker push lftconcept/multi-client
docker push lftconcept/multi-server
docker push lftconcept/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=lftconcept/multi-server