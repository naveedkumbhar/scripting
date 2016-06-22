#!/bin/bash
sudo apt-get update
sudo apt-get install python-pip build-essential python-dev -y
sudo pip install Glances -y
sudo pip install PySensors -y
sudo apt-get install saidar -y
