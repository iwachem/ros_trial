docker build -t iwachem/ros_melodic:20200924 \
  --build-arg UID=$(id -u $USER) \
  --build-arg USER_NAME=$USER \
  .
