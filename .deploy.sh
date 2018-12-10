docker build -t lftconcept/multi-client:latest -t lftconcept/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t lftconcept/multi-server:latest -t lftconcept/multi-server:$SHA -f ./server/Dockerfile ./server
dokcer build -t lftconcept/multi-worker:latest -t lftconcept/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push lftconcept/multi-client:latest
docker push lftconcept/multi-server:latest
docker push lftconcept/multi-worker:latest

docker push lftconcept/multi-client:$SHA
docker push lftconcept/multi-server:$SHA
docker push lftconcept/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=lftconcept/multi-client:$SHA
kubectl set image deployments/server-deployment server=lftconcept/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=lftconcept/multi-worker:$SHA