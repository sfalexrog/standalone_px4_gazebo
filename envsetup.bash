SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo -e "SCRIPT_DIR: ${SCRIPT_DIR}"

export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:${SCRIPT_DIR}/models

echo -e "GAZEBO_MODEL_PATH ${GAZEBO_MODEL_PATH}"
