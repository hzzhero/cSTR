FROM centos:7.9.2009

MAINTAINER hezhizhen@cestc.cn

COPY cSTR_gitbook  /home/cSTR_gitbook

RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash
RUN yum -y install nodejs
RUN npm  --registry https://registry.npm.taobao.org   install gitbook-cli -g
RUN sed -i 's/confirm: true/confirm: false/'  /root/.gitbook/versions/3.2.3/lib/output/website/copyPluginAssets.js
RUN gitbook install

WORKDIR /home/cSTR_gitbook

CMD ["cd", "/home/cSTR_gitbook"]
