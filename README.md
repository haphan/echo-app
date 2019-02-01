# haphan/echo-app

### Requirements
- `go`
- `dep`
- `make`
- `docker` (optional)


### Build from source

```bash
git clone https://bitbucket.org/haphan/echo-app.git && cd echo-app
make
```

### Launch stand-alone container

```bash
docker run --name echo-app -it -d -p 8080:8080 haphan/echo-app:latest
```

### Docker-compose

```bash
git clone https://bitbucket.org/haphan/echo-app.git && cd echo-app
docker-compose up -d
```
