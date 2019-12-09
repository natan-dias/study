# Docker Containers Collections

A collection of containers for multiple purposes

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system

Look for "Contributing" to more details of how to contribute with this project

### Prerequisites

Softwares needed for this project:

```
- Docker
- Git
```

### Installing

First install docker and git on your enviroment

```
RPM Based
- dnf install docker
- dnf install git

Debian Based
- apt-get install docker
- apt-get install git
```

You'll need to configure this tools, but these steps will not be aborded in this documentation 

## Running the tests

The format of this project will be Dockerfiles configured to attend any needs

Feel free to make alterations on these files

To test containers and aplications you'll have to make a clone on your enviroment and build a Docker container

### Break down into end to end tests

To build a container with Dockerfile the sintaxe is:

```
Docker build -t name_of_container .
```

## Deployment

Docker containers was made in RPM Based system, so watch for bugs on another OS

## Built With

* [Docker](https://docker.com) - Enterprise Container Plataform for HV Innovation
* [Hubdino](http://Hubdino.me) - Sites and Marketing

## Contributing

Please read [CONTRIBUTING.md](https://github.com/natandino/docker/blob/master/CONTIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [Visual Studio Code](https://code.visualstudio.com) for versions.

## Authors

* **Natan Dias** - *Editor, IT Analyst and Developer* - [HubDino](http://hubdino.me)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Using Docker to make things better and easier
