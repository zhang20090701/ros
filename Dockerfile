FROM ros:foxy

# 切换到root，root才有权限进行安装软件等操作
USER root

# 替换桌面背景（Dockerfile同目录下有图片screen-4.jpg）


# 编辑sources.list，使用官方软件源
# 根据自己需求安装一些linux工具，如ping、tftp
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y iputils-ping tftp lsb-core firefox&& \
    apt-get clean
    
# 安装turtlesim功能包
RUN apt-get install -y ros-foxy-turtlesim

# 在生成镜像之前切换回default
USER 1000
# 添加docker用户并默认是使用docker用户密码也是docker
RUN apt-get update &&\
	apt-get -y install sudo
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
USER docker
CMD /bin/bash
