mkdir deleteme
cd deleteme
wget https://repo.continuum.io/archive/Anaconda2-4.3.1-Linux-x86_64.sh
chmod 755 Anaconda2-4.3.1-Linux-x86_64.sh
bash Anaconda2-4.3.1-Linux-x86_64.sh -f -b -p /usr/anaconda
echo "export PATH=/usr/anaconda/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
conda create -y -n py27
source activate py27
conda install -y python=2.7.11
##Make sure that the requirements files is present
for req in $(cat ../requirements.txt); do conda install -y $req; done

##Install tensorflow
conda install -y -c conda-forge tensorflow

##Make sure JAVA_HOME is set, or else this will fail
pip install pydoop

source deactivate py27

##Clean up
cd ..
rm -rf deleteme

##Create an environment for Caffe
conda create -y -n pycaffe
source activate pycaffe
conda install -y python=2.7.11

##Make sure the protobuf is only the one installed with yum
conda remove -y libprotobuf
conda install -y libprotobuf
source deactivate pycaffe

