# Godot XR Axis Studio Tracker

![GitHub forks](https://img.shields.io/github/forks/Malcolmnixon/GodotXRAxisStudioTracker?style=plastic)
![GitHub Repo stars](https://img.shields.io/github/stars/Malcolmnixon/GodotXRAxisStudioTracker?style=plastic)
![GitHub contributors](https://img.shields.io/github/contributors/Malcolmnixon/GodotXRAxisStudioTracker?style=plastic)
![GitHub](https://img.shields.io/github/license/Malcolmnixon/GodotXRAxisStudioTracker?style=plastic)

This repository contains an Axis Studio BVH Broadcast decoder for Godot that can drive avatars through the XR Tracker system.

![Axis Studio Preview](/docs/axis_studio_preview.png)

## Versions

Official releases are tagged and can be found [here](https://github.com/Malcolmnixon/GodotXRAxisStudioTracker/releases).

The following branches are in active development:
|  Branch   |  Description                  |  Godot version   |
|-----------|-------------------------------|------------------|
|  master   | Current development branch    |  Godot 4.3-dev6+ |

## Overview

[Axis Studio](https://neuronmocap.com/pages/axis-studio) is a Motion Capture package by Perception Neuron.

## Usage

The following steps show how to add the Godot Axis Studio tracker to a project.

### Enable Addon

The addon files needs to be copied to the `/addons/godot_axis_studio_tracker` folder of the Godot project, and then enabled in Plugins under the Project Settings:
![Enable Plugin](/docs/enable_plugin.png)

### Plugin Settings

The plugin has numerous options to control behavior:

![Plugin Options](/docs/plugin_settings.png)

| Option | Description |
| :----- | :---------- |
| Tracking - Position Mode | Controls the position of the character:<br>- Free = Free Movement<br>- Calibrate = Calibrate to origin on first frame<br>- Locked = Lock to origin |
| Tracking - Body Tracker Name | Name for the [XRBodyTracker](https://docs.godotengine.org/en/latest/classes/class_xrbodytracker.html#class-xrbodytracker) |
| Network - Udp Listener Port | Port to listen for BVH network packets |

### Character Importing

The character model must be in Godot Humanoid format. This can be achieved in the importer settings by retarteting the skeleton to the SkeletonProfileHumanoid bone map:

![Character Import](/docs/character_import.png)

### Body Driving

The body is positioned using an [XRNode3D](https://docs.godotengine.org/en/latest/classes/class_xrnode3d.html) node configured to track the character body:

![XRNode3D](/docs/xrnode3d.png)

The body is driven using an [XRBodyModifier3D](https://docs.godotengine.org/en/latest/classes/class_xrbodymodifier3d.html) node configured to drive the skeleton of the character:

![XRBodyModifier3D](/docs/xrbodymodifier3d.png)

Note that the Body Tracker name should match the Body Tracker Name specified in the Plugin Settings.

### Axis Studio Application

Axis Studio must be configured for BVH broadcasting.

![Axis Studio BVH](/docs/axis_studio_bvh.png)

| Option | Description |
| :----- | :---------- |
| Skeleton | Use the standard Axis Studio Skeleton | 
| Rotation | Use YXZ |
| Displacement | Enable |
| Frame Type | Binary |
| Protocol | UDP |
| Destination Address | 255.255.255.255 (broadcast) |
| Destination Port | 7004 (default) |


## Licensing

Code in this repository is licensed under the MIT license.

## About this repository

This repository was created by Malcolm Nixon

It is primarily maintained by:
- [Malcolm Nixon](https://github.com/Malcolmnixon/)

For further contributors please see `CONTRIBUTORS.md`
