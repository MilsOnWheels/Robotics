# Robotics
Code Repository for Robotics Assignment 2

# Abstract
This assignment has been performed as part of curriculum for 41013 - Robotics in order to design and code a pick and place application involving the DoBot Magician with a gripper. This repository will be updated along the way with our progress throughout the semester.
Please See each section for detail explanation.

# Visual Servoing using Kinect v1 in ROS
This task aims to develop a process to detect, identify and localise AR Tags.
For this particular reason we have decided to implement the ar_track_alvar, which is an AR Tag Tracking library.
Ar Tag Track library can:
  1. Generate AR Tags of various sizes and and resolutions,
  2. Identifying and tracking the pose of individual tags, a feature that is enhanced by the depth sensors of the Kinect, and
  3. IDintifying and tracking the pose of a bundle of tags, and
 
 An appropriate size of the tag has to be created, usually 5cm by 5cm (thats how we have calibrated the tracking libary).
 Our work consisted of making the ar tag tracking library compatible with the kinnect. As a result we created an external ar track alvar launch file in order to adopt it for our kinect application (see launch file "kinect_cam_ar_track.launch"). In this case, we had to relate the various topics of the launch file to the arguments.The remapping of the launch file was done in order to adopt the rostopic parameters of the kinect camera to our launch file. An example can be previewed below:
 
    <arg name="cam_image_topic"      default="/camera/rgb/image_color" />
    <arg name="cam_info_topic"       default="/camera/rgb/camera_info" />
    <arg name="output_frame"         default="/camera_rgb_frame" />
    
  In order to have a complete overview of the application we utilised RVIZ and selected topics of: 1. Camera, 2. PointCloud2, 3. TFs.
  The detection of the AR Tag can be previewed below.
  In order to obtain the trasforms and orientation of the AR Tags we utilised "rostopic echo /ar_pose_marker to obtain the coordinate elements of the ar tag.
  ![Screenshot from 2021-04-26 17-53-20](https://user-images.githubusercontent.com/82622010/116048250-54b0d380-a6b8-11eb-9e0e-1f95ac59d215.png)
  
  In order to pass the coordinate parameters on matlab, a ROS subscriber will be utilised to extract the tag data from the publisher (in this case ROS terminal)
  
  Future Task: Implement AR Tag tracking methodology in gazebo.
