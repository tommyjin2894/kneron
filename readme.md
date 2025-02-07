# kneron

Vienna SDK with KLM5S3 SoC platform

### 필요 패키지
- Toolchain (리눅스 18.04 <docker env>)
- Embedded Linux software packages
- Root file system and utils
- KLM5S3 EVM(evaluation module)

### YoloX 훈련을 위한 과정
- [yoloX](https://doc.kneron.com/docs/#model_training/OpenMMLab/YoloX/)
  - NVIDIA Container Toolkit
    - https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
 
    `sudo apt-get install -y nvidia-container-toolkit`
  
- 도커 Pull
  ```bash
  docker pull nvidia/cuda:12.1.0-devel-ubuntu18.04
  docker run -v /mnt/hgfs/1804/:/workspace -it --rm --gpus all nvidia/cuda:12.1.0-devel-ubuntu18.04
  ```

- 'cd /workspace'
- 필요 tool 설치
  ```
  chmod +x setup_yolox.sh
  ./setup_yolox.sh
  ```

---
### 사전 훈련 모델 이용
```
mkdir work_dirs
cd work_dirs
wget https://github.com/kneron/Model_Zoo/raw/main/mmdetection/yolox_s/latest.zip
unzip latest.zip
cd ..
```
  
---
### onnx -> nef
- 도커 Pull
  ```bash
  sudo docker run --rm -it -v /mnt/hgfs/Competition:/data1 kneron/toolchain:latest

  pip install jupyter notebook
  
  ```

---
### yolo3 실행시 (outdated)
[yolo3 docs_example](https://doc.kneron.com/docs/#toolchain/appendix/yolo_example_InModelPreproc_trick/)

- yolo3 가 있는 상위 폴더로 가서 import yolo3
  ```bash
  cd data1/keras_yolo3
  python
  >>> import yolo3
  ```

- 우분투 이용시 18.04 (도커 이용) `docker run --rm -it -v /mnt/lv01/tommy/catchcam:/data1 kneron/toolchain:latest`
- 접촉불량의 가능성 있음 -> usb 연결 확인

### 참고 자료
- pt 모델
    - Fire-YOLOv5s
  - GCM-YOLO
  - [fire detection](https://github.com/spacewalk01/yolov5-fire-detection)
  - [fire detection 2](https://github.com/MuhammadMoinFaisal/FireDetectionYOLOv8)
  - [fire detection 3](https://www.hackster.io/innovation4x/early-fire-detection-using-ai-dd27bf)
  - [산불감지](https://www.mdpi.com/1999-4907/15/1/204)
- 데이터 셋
  - [fire dataset](https://www.kaggle.com/datasets/phylake1337/fire-dataset/data)
  - [화재 데이터셋 공공](https://aihub.or.kr/aihubdata/data/list.do?searchKeyword=%ED%99%94%EC%9E%AC)

