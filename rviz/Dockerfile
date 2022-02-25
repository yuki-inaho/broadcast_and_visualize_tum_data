
FROM osrf/ros:noetic-desktop-full
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y ros-noetic-rviz

WORKDIR /app
COPY rviz /app