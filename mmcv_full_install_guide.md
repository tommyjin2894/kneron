### 도커 환경설정 이미지

https://mmcv.readthedocs.io/en/master/get_started/build.html

docekr
```
docker run -v /mnt/hgfs/1804/:/workspace -it --rm --gpus all graphcore/pytorch:latest
pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/ascend/torch1.8.0/index.html
```

---
- docker 이미지
  ```bash
  CONTAINER ID   IMAGE                      COMMAND       CREATED          STATUS          PORTS     NAMES
  64f0a4e0991b   graphcore/pytorch:latest   "/bin/bash"   13 minutes ago   Up 13 minutes             suspicious_mayer
  tommy@tommy:/mnt/hgfs/1804$ docker commit 64f0a4e0991b crazy2894/mmcv:latest
  ```
---

- 커스텀 이미지
```
docker run -v /mnt/hgfs/1804/:/workspace -it --rm --gpus all crazy2894/mmcv:latest
```
