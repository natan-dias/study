FROM fedora

RUN dnf -y update && dnf clean all
RUN dnf -y install nginx && dnf clean all
RUN dnf -y install less && dnf clean all
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN echo "nginx on Fedora" > /usr/share/nginx/html/index.html

EXPOSE 80
EXPOSE 443

CMD [ "/usr/sbin/nginx" ]