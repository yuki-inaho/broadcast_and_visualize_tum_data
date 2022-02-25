HOST := $(shell hostname)
ADDR := $(shell avahi-resolve-host-name -4 ${HOST}.local | cut -f 2)

.PHONY: build
build:
	docker build -t rviz:1.0 -f ./Dockerfile ..

.PHONY: build_gpu
build_gpu:
	docker build -t rviz-gpu:1.0 -f ./Dockerfile-gpu ..

.PHONY: run
run:
	xhost +local:root
	docker run -it --rm --name rviz --privileged \
		--net="host" --ipc="host" \
		--add-host=${HOST}:${ADDR} \
		--env DISPLAY=${DISPLAY} \
		--env=QT_X11_NO_MITSHM=1 \
		--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		--env ROS_MASTER_URI=http://${HOST}:11311 \
		rviz:1.0 bash -c "rviz"

.PHONY: run_gpu
run_gpu:
	xhost + local:root
	sudo docker run -it \
	--network="host" --ipc="host" \
	--add-host=${HOST}:${ADDR} \
	--env=DISPLAY=$(DISPLAY) \
	--env=QT_X11_NO_MITSHM=1 \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--privileged \
	--device=/dev/dri:/dev/dri \
	--gpus all \
	--mount type=bind,src=/dev,dst=/dev,readonly \
	--env ROS_MASTER_URI=http://${HOST}:11311 \
	rviz-gpu:1.0 bash