apt-get update
apt-get install wget

# miniconda 설치
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
source ~/miniconda3/bin/activate
conda init --all

conda create -n kneron python==3.9
conda activate kneron
#----------------------------------------------------------------------------------------#
apt update && apt install -y software-properties-common # 소프트웨어 관리도구 추가
apt install git-all # 깃 설치
apt install unzip # unzip 설치
  
# 컴파일러 설치
add-apt-repository ppa:ubuntu-toolchain-r/test -y
apt update
apt install -y gcc-9 g++-9
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9
update-alternatives --config gcc

# 버전 확인
gcc --version
g++ --version

pip install torch==2.6.0
pip install numpy==2.0.2
pip install torchvision==0.21.0
pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/cu121/torch2.6.0/index.html
pip install mmcv
pip install onnx
pip install onnxoptimizer

git clone https://github.com/kneron/kneron-mmdetection
cd kneron-mmdetection

pip install -r requirements/build.txt
pip install -v -e .
