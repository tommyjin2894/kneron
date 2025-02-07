
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
