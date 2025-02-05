# Vienna USER GUIDE
Vienna SDK with KLM5S3 SoC platform

### 필요 패키지
- Toolchain (리눅스 18.04 <docker env>)
- Embedded Linux software packages
- Root file system and utils
- KLM5S3 EVM(evaluation module)

### yoloX guide link
- [yoloX](https://doc.kneron.com/docs/#model_training/OpenMMLab/YoloX/)
  - pt -> onnx -> bie -> nef(destination)

### docker 가져오고 실행하기
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
