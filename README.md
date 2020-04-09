# Standalone PX4 sim files

Additional models and worlds for PX4 Gazebo simulation.

## Assumptions

We assume that you already have a working ROS and Gazebo installation. We further assume you've built your PX4 SITL config and Gazebo plugins.

If this is not true, do the following:

* Clone PX4 from CopterExpress: `git clone https://github.com/CopterExpress/Firmware -b v1.10.1-clever`
* Build `px4_sitl` and `sitl_gazebo` targets: run `make px4_sitl sitl_gazebo` in the firmware checkout directory
  * Note that one of the Gazebo plugins will fail to compile. Apply this commit: https://github.com/PX4/sitl_gazebo/commit/7635df811986f1da69a28ffdd195faa22be7ada5 to `Firmware/Tools/sitl_gazebo`

## Running

Be sure to source your ROS environment:

```bash
source /opt/ros/melodic/setup.bash
```

Set `PX4_PATH` environment variable to your PX4 source checkout and run the `run_all.sh` script:

```bash
export PX4_PATH=/path/to/px4/Firmware
./run_all.sh
```

You may specify a different world for `run_all.sh`. The world is expected to be in the `worlds` folder. You don't need to specify the `.world` extension:

```bash
./run_all.sh clever
```

Note that this only launches Gazebo and PX4, you'll need to run your Clover nodes separately.

## Hacking

You can change the estimator in `run_all.sh`.

`PX4_SIM_MODEL` is the name of the config file that will be loaded by PX4. Config files are available in the `px4_config/ROMFS/px4fmu_common/init.d-posix` folder.

See https://github.com/sfalexrog/aruco_gazebo_gen for a simplified way of generating worlds with ArUco markers. The default world contains ArUco pattern that correspods to `office.txt` map from the Clever repository.
