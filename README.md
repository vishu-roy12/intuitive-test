# intuitive-test

## Creating docker image ##
Below are the commands which can be used to create docker image. Considering you are in the same path where Dockerfile lives

```
docker build -t intuitive-dockerfile .
```
## Starting container with the created image ##

```
docker run -d intuitive-dockerfile ( This will run the container in background)
```
```
docker run -d --name test intuitive-dockerfile ( This will run the container in background with name test)
```

## Tagging the docker image ##

```
docker tag intuitive-dockerfile royvishu1224/test:1.0.1
```

## Pushing to dockerhub ##

```
docker push royvishu1224/test:1.0.1
```