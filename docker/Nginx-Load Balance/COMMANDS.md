# Commands

## At Load Balancer
 
Run commands in the same folder where dockerfile is located:

```
docker build -t nginxlb .
```

This will download nginx and create the container.

```
docker run --name nginxlb -p 80:80 -d nginxlb
```

This will run the container at detach mode, mapping port 80 with the name "nginxlb".

## At Nodes

Run commands in the same folder where dockerfile is located:

```
docker build -t nginxnode1 .
```

This will download nginx and create the container.

```
docker run --name nginxnode1 -p 80:80 -d nginxnode1
```

This will run the container at detach mode, mapping port 80 with the name "nginxnode1".

### nginx.conf

The conf file will be copied to nginx container, changing the default configuration.

You can change that at will.
