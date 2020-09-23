SCRIPT_DIR=$(cd $(dirname $0); pwd)
BASHRC=$SCRIPT_DIR/../env/.bashrc
LOCAL_DIR=$SCRIPT_DIR/../env/.local
CONFIG_DIR=$SCRIPT_DIR/../env/.config
CATKIN_WS=$SCRIPT_DIR/../catkin_ws

docker run --rm -it \
  --name ros_iwachem \
  --gpus all \
  -v /etc/passwd:/etc/passwd:ro \
  -v /etc/group:/etc/group:ro \
  -u $(id -u $USER):$(id -g $USER) \
  --net=host \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=$DISPLAY \
  -v $HOME/.Xauthority:$HOME/.Xauthority \
  -v $BASHRC:$HOME/.bashrc \
  -v $LOCAL_DIR:$HOME/.local \
  -v $CONFIG_DIR:$HOME/.config \
  -v $CATKIN_WS:$HOME/catkin_ws \
  iwachem/ros_melodic:20200924
