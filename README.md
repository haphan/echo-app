# haphan/echo-app

### Requirements
- `go`
- `dep`
- `make`
- `docker` (optional)


### Build from source

```bash
git clone https://github.com/haphan/echo-app.git && cd echo-app
make
```

### Launch stand-alone container

```bash
docker run --name echo-app -it -d -p 8080:8080 haphan/echo-app:latest
```

### Test locally using `docker-compose`

```bash
git clone https://github.com/haphan/echo-app.git && cd echo-app
docker-compose up -d
```

### Deploy to kubernetes

```bash
kubectl create -f kubernetes/deploy.yml
kubectl create -f kubernetes/service.yml
```

If your k8s cluster does not support LoadBalancer e.g. `minikube`, try NodePort instead

```bash
kubectl expose deployment echo --port=8080 --type=NodePort
```