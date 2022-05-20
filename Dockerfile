FROM centos

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install sudo
RUN yum -y install man-pages man-db man
RUN yum -y install passwd
RUN yum -y install which
RUN yum -y install mlocate
RUN sudo updatedb

CMD ["/bin/bash"] 