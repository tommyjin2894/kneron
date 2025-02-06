### 도커 환경설정 이미지

https://mmcv.readthedocs.io/en/master/get_started/build.html

docker run -v /mnt/hgfs/1804/:/workspace -it --rm --gpus all graphcore/pytorch:latest
pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/ascend/torch1.8.0/index.html
