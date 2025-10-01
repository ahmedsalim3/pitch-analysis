#!/bin/bash
# =========================================================================================
# Train YOLO11 for Soccer Detection (ball, goalkeeper, player, referee)
# find the dataset here:
# https://universe.roboflow.com/roboflow-jvuqo/football-players-detection-3zvbc/dataset/1
# =========================================================================================

set -e

DATA_YAML="./data/data.yaml"
DOWNLOAD_DATA="./scripts/download-football-players-detection-data.sh"

if [ ! -f "$DATA_YAML" ]; then
    echo "[INFO] $DATA_YAML not found."
    bash "$DOWNLOAD_DATA"
fi

uv run yolo task=detect mode=train \
  data=$DATA_YAML \
  model=yolo11l.pt \
  epochs=200 \
  imgsz=640 \
  batch=8 \
  device=0 \
  optimizer=SGD \
  lr0=0.01 \
  lrf=0.2 \
  weight_decay=0.0005 \
  amp \
  patience=50 \
  project=./experiments/runs \
  name=football_yolo11

WEIGHTS_DIR="./experiments/runs/football_yolo11/weights"
BEST_WEIGHTS="$WEIGHTS_DIR/best.pt"

if [ -f "$BEST_WEIGHTS" ]; then
    mkdir -p ./pitch/weights
    cp "$BEST_WEIGHTS" ./pitch/weights/yolo11_best.pt
    echo "[INFO] Best weights saved in ./pitch/weights/yolo11_best.pt"
fi
rm -rf *.pt

echo "[INFO] Done."