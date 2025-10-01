#!/bin/bash
# =========================================================================================
# Download YOLO11 soccer detection dataset from Roboflow
# find the dataset here:
# https://universe.roboflow.com/roboflow-jvuqo/football-players-detection-3zvbc/dataset/1
# =========================================================================================

DATA_DIR="./data"
mkdir -p "$DATA_DIR"

python3 <<EOF
from roboflow import Roboflow
import os

rf = Roboflow(api_key="AplCqtWeRPrIQIzdZJgr")
project = rf.workspace("roboflow-jvuqo").project("football-players-detection-3zvbc")
version = project.version(1)
dataset = version.download("yolov11", location="$DATA_DIR/football-players-detection")
print(f"[INFO] Dataset downloaded to: {dataset.location}")
EOF

mv $DATA_DIR/football-players-detection/* $DATA_DIR/ && rm -rf $DATA_DIR/football-players-detection
echo "[INFO] Done."