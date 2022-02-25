FROM ros:noetic-ros-base

WORKDIR /app
COPY . /app

ENV ROS_LANG_DISABLE=geneus:genlisp:gennodejs
RUN /app/setup.sh

#CMD [ "/app/docker-entrypoint.sh" ]