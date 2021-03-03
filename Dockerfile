FROM centos
RUN yum -y install createrepo
RUN yum -y install wget
RUN mkdir -p /home/httpd-repo1
RUN dnf install -y  mod_http2
RUN yum clean all



RUN wget -r -np -nH   10.0.2.15:8899/repo/ -P /home/httpd-repo1
RUN ls /home/httpd-repo1/repo
RUN echo [customrepo] >> /etc/yum.repos.d/custom.repo
RUN echo name=Custom Repository >> /etc/yum.repos.d/custom.repo
RUN echo baseurl=file:///home/httpd-repo1 >> /etc/yum.repos.d/custom.repo
RUN echo enabled=1 >> /etc/yum.repos.d/custom.repo
RUN echo gpgcheck=0 >> /etc/yum.repos.d/custom.repo
RUN createrepo -p /home/httpd-repo1
RUN yum repolist
RUN yum --disablerepo=* --enablerepo="customrepo" install -y  httpd
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80

RUN touch index.html /var/www/html/
RUN echo "<!DOCTYPE html>" > /var/www/html/index.html
RUN echo "<html>" >> /var/www/html/index.html
RUN echo "<body>" >> /var/www/html/index.html
RUN echo "<h1> task3 </h1>" >> /var/www/html/index.html

RUN sudo service httpd status
RUN echo "<style>body {  background-color: black;  text-align: center; color: white;font-family: Arial, Helvetica, sans-serif;}</style></head><body>" >> /var/www/html/index.html
RUN echo "</body>" >> /var/www/html/index.html
RUN echo "</html>" >> /var/www/html/index.html


