#!/bin/bash

# Hack, but oh well
if [ -z "${PX4_PATH}" ]; then
  echo "PX4_PATH is not set; set it to your PX4 Firmware source checkout!"
  exit 1
fi

if [ -z "${ROS_DISTRO}" ]; then
  echo "ROS_DISTRO is not set; source your ROS setup.bash!"
  exit 1
fi

# hack
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export PX4_ESTIMATOR="lpe"
# export PX4_ESTIMATOR="ekf2"
# export PX4_SIM_MODEL="iris_ros"
export PX4_SIM_MODEL="clover4_opt_flow"



WORLD_NAME=$1

if [ -z ${WORLD_NAME} ]; then
  WORLD_NAME=aruco_world
fi

source ${SCRIPT_DIR}/envsetup.bash
# hack
source ${PX4_PATH}/Tools/setup_gazebo.bash /home/sf/devel/px4/Firmware /home/sf/devel/px4/Firmware/build/px4_sitl_default

roslaunch gazebo_ros empty_world.launch verbose:=true world_name:=${SCRIPT_DIR}/worlds/${WORLD_NAME}.world &
GAZEBO_PID="$!"

${PX4_PATH}/build/px4_sitl_default/bin/px4 "${SCRIPT_DIR}"/px4_config/ROMFS/px4fmu_common -s etc/init.d-posix/rcS

echo "Cleaning up..."
kill ${GAZEBO_PID}
wait ${GAZEBO_PID}
