[docs_example](https://doc.kneron.com/docs/#toolchain/appendix/yolo_example_InModelPreproc_trick/)

- 테스트 한 tool chain 버전
  - `docker run --rm -it -v /mnt/lv01/tommy/catchcam:/data1 kneron/toolchain:latest`
  - `docker run --rm -it -v /mnt/lv01/tommy/catchcam:/data1 kneron/toolchain:v0.17.2`

- yolo3 가 있는 상위 폴더로 가서 import yolo3
```bash
cd data1/keras_yolo3
python
>>> import yolo3
```

- 우분투 이용시 18.04 (도커 이용) `docker run --rm -it -v /mnt/lv01/tommy/catchcam:/data1 kneron/toolchain:latest`
- 주의 (접촉불량의 가능성 있음 -> usb 모든 연결 확인)
