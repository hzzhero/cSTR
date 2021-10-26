FROM centos:7.9.2009

MAINTAINER hezhizhen@cestc.cn

COPY cSTR_gitbook  /home/cSTR_gitbook

RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash
RUN yum -y install nodejs
RUN npm  --registry https://registry.npm.taobao.org   install gitbook-cli -g
RUN gitbook install

WORKDIR /home/cSTR_gitbook

CMD ["gitbook", "serve"]