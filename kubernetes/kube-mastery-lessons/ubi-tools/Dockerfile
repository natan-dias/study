FROM registry.access.redhat.com/ubi8/ubi

WORKDIR \root

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm 
RUN dnf install -y httping \
	nmap
