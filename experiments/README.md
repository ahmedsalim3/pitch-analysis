# Football Player Detection Weights

These weights were trained with **YOLOv11-Large** for detecting football players.

## Training
- **Model**: YOLO11-Large (`yolo11l.pt` pretrained on COCO)  
- **Dataset**: [Football Players Detection (Roboflow)](https://universe.roboflow.com/roboflow-jvuqo/football-players-detection-3zvbc/dataset/1)  
  - 612 training images  
  - 38 validation images  
- **Runs & args**: see [model parameters](./runs/football_yolo11/args.yaml)

## Structure
```sh
.
├── README.md
└── runs
    └── football_yolo11
        ├── args.yaml
        ├── BoxF1_curve.png
        ├── BoxP_curve.png
        ├── BoxPR_curve.png
        ├── BoxR_curve.png
        ├── confusion_matrix_normalized.png
        ├── confusion_matrix.png
        ├── labels.jpg
        ├── results.csv
        ├── results.png
        ├── train_batch0.jpg
        ├── train_batch1.jpg
        ├── train_batch2.jpg
        ├── val_batch0_labels.jpg
        ├── val_batch0_pred.jpg
        ├── val_batch1_labels.jpg
        ├── val_batch1_pred.jpg
        ├── val_batch2_labels.jpg
        ├── val_batch2_pred.jpg
        └── weights
            ├── best.pt
            └── last.pt
```
