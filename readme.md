# Vienna USER GUIDE
Vienna SDK with KLM5S3 SoC platform

### 필요 패키지
- Toolchain (리눅스 18.04 <docker env>)
- Embedded Linux software packages
- Root file system and utils
- KLM5S3 EVM(evaluation module)

### docker 가져오고 실행하기

- 툴체인
  [tool chain](https://doc.kneron.com/docs/#toolchain/manual_2_deploy/)

  ```bash
  docker pull kneron/toolchain:latest
  docker run --rm -it -v /mnt/docker:/docker_mount kneron/toolchain:latest
  # 오류날 시에 실행 : docker run --rm -it -v /mnt/lv01/tommy/catchcam:/data1 kneron/toolchain:v0.17.2
  ```

  - webgui 로 실행
  ```bash
  docker run -t -d -p 8180:8180 --name toolchain_webgui -w /workspace kneron/toolchain:latest /workspace/webgui/runWebGUI.sh
  
  ### http://127.0.0.1:8180/. 로 접속
  ```
  
  - 폴더 구조
    ```text
    /workspace
    |-- E2E_Simulator       # End to end simulator
    |-- ai_training         # AI training project.
    |-- cmake               # Environment
    |-- examples            # Example for the workflow, will be used later.
    |-- libs                # The libraries
    |   |-- ONNX_Convertor  # ONNX Converters and optimizer scripts, will be discussed in section 3.
    |   |-- c_sim_[version] # Hardware simulators for specific hardware versions.
    |   |-- compiler        # Compiler for the hardware and the IP evaluator to infer the performance.
    |   |-- dynasty         # Simulator which only simulates the calculation.
    |   `-- fpAnalyser      # Analyze the model and provide fixed point information.
    |-- miniconda           # Environment
    |-- scripts             # Scripts to run the tools, will be discussed in section 3.
    |-- webgui              # Web GUI for the toolchain. Please check appendix for details.
    `-- version.txt
    ```
### YoloX 훈련을 위한 과정
- [yoloX](https://doc.kneron.com/docs/#model_training/OpenMMLab/YoloX/)
  - NVIDIA Container Toolkit
    - https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
 
    `sudo apt-get install -y nvidia-container-toolkit`
  
- 도커 Pull
  ```bash
  docker pull nvidia/cuda:12.1.0-devel-ubuntu18.04
  docker run -v /home/tommy/Documents/ubuntu1804inst/:/workspace -it --rm --gpus all nvidia/cuda:12.1.0-devel-ubuntu18.04
  ```
    
- wget 설치
  ```
  apt-get update
  apt-get install wget
  ```
    
- miniconda 설치
  ```
  mkdir -p ~/miniconda3
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm ~/miniconda3/miniconda.sh

  source ~/miniconda3/bin/activate
  conda init --all
  ```

  ```
  conda create -n kneron python==3.9
  conda activate kneron
  ```
  소프트웨어 관리도구 추가
  ```
  apt update && apt install -y software-properties-common
  ```

  깃 설치
  ```
  apt install git-all
  ```

  unzip 설치
  ```
  sudo apt install unzip
  ```
  
  컴파일러 설치
  ```
  add-apt-repository ppa:ubuntu-toolchain-r/test -y
  apt update
  apt install -y gcc-9 g++-9

  update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 \
  --slave /usr/bin/g++ g++ /usr/bin/g++-9
  update-alternatives --config gcc

  # 버전 확인
  gcc --version
  g++ --version
  ```

  ```
  pip install torch==2.6.0
  pip install numpy==2.0.2
  pip install torchvision==0.21.0
  pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/cu121/torch2.6.0/index.html
  pip install mmcv
  pip install onnx
  pip install onnxoptimizer
  ```

  ```
  git clone https://github.com/kneron/kneron-mmdetection
  cd kneron-mmdetection
  ```

  ```
  pip install -r requirements/build.txt
  pip install -v -e .
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

