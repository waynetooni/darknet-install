#!/bin/bash 

# 2020.09.15 version final
# ubuntu opencv install bash
# by Show & Wei-Yao & Kai

# work for ubuntu 16.04
#	   cuda 10.0 / 10.1 / 10.2
#	   cudnn 7.3.0 ~ 8.0.2
   
declare -A cudnnDownloadlink=( 	["7.3.0_10.0"]="1FnAuVQKB07bOco0eHxoitNrutbV9b9Hq" ["7.3.1_10.0"]="10fA5He6jvtGrBWdcqmxu3S0yEsQfThP9" ["7.4.1_10.0"]="1BIGMG26ORYwfa_IzePDRZ5Gk0yocHW6T" 
                            	["7.4.2_10.0"]="13PUVDQNmWEFNL_4sxBZgCnNHGneS4caL" ["7.5.0_10.0"]="1SRKy7ApsD8Nx3UMfcahnKhGj055Qn9TK" ["7.5.0_10.1"]="1nX6k7i5ecmUBmQFb8Slqpghsr1Z5u3OK"                                  
							   	["7.5.1_10.0"]="1UjNE8r9XfMjC8QsRFmPllLqB7p1RKyi5" ["7.5.1_10.1"]="1e6ZEvFO3fvdo4-ZXBhTlk6S8XylDfdhU" ["7.6.0_10.0"]="1SptXee8rQnbYIw0TI26gJjaiGBvB4oLL"
                              	["7.6.0_10.1"]="1a-XVMBfgg7IZiR0MufOdVnePqvjLZWVJ" ["7.6.1_10.0"]="1puCmYXJV2VrsE3jqFUq0o682AHXdHukY" ["7.6.1_10.1"]="1R55qJ7XWzFlpgk03Z6no183p_XN_MLtB"
							  	["7.6.2_10.0"]="1AAwwPxHaoKfPinD1S2JeknIHj4F_Vmi6" ["7.6.2_10.1"]="1iAi90KT95Ad5yQUYkUNk3aPB_IFaoYEW" ["7.6.3_10.0"]="17H1uNdItUFD-i6ReASpX_IqM-7AIHbLh"
                              	["7.6.3_10.1"]="1WGofH9TnE3haJOUAGgVTDC5Ms1NzPho-" ["7.6.4_10.0"]="1j1Bwn2qp_gqyzHIs0m3F4xzxpT6vfwaQ" ["7.6.4_10.1"]="19GFuYgj8ty1Vq1Ex-LTZVWKficKAGCKL"
								["7.6.5_10.0"]="1oUOQQKZfg9ZGfEMe4ZUbeQ90WZO1-lqe" ["7.6.5_10.1"]="1dP2jlSAhzOWt_FKY8tfzN9NPAsXY0ylp" ["7.6.5_10.2"]="1EMbHQ-fnvdnZd4hKmMFhD5mu34kjiUnd" 
                              	["8.0.2_10.1"]="1nrTMjzmqDsK9BDwl8w9zkwlfpRn2wpeB" ["8.0.2_10.2"]="1MZLkYGSFwK6XBqhxt3Y2b9753-qmmw5s" )






read -p "-- Please enter the CUDA version(10.2, 10.1, 10.0) : " version
read -p "-- Please enter the CUDNN version(7.3.0 ~ 8.0.2) : " cudnnVersion
while [ true ] 
do
	if [ "${cudnnDownloadlink["$cudnnVersion"_"$version"]}" != "" ] ; then
		break
	else
		read -p "-- No match version please enter correct CUDNN version(7.3.0 ~ 8.0.2) : " cudnnVersion
	fi
done

read -p "-- Please enter the opencv version : " openVersion

if [ "$version" = "10.0" ] ; then
#**********************************************************
#*********************Cuda10.0 install*********************
#**********************************************************
	wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64
	dpkg -i cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64
	apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
	apt-get update
	apt-get install -y cuda
	apt-get autoremove nvidia-cuda-toolkit
	echo "export PATH=$PATH:/usr/local/cuda-10.0/bin\${PATH:+:\${PATH}}" | tee -a ~/.bashrc
	source ~/.bashrc

elif [ "$version" = "10.1" ] ; then
#**********************************************************
#*********************Cuda10.1 install*********************
#**********************************************************
	wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-ubuntu1604-10-1-local-10.1.105-418.39_1.0-1_amd64.deb
	dpkg -i cuda-repo-ubuntu1604-10-1-local-10.1.105-418.39_1.0-1_amd64.deb
	apt-key add /var/cuda-repo-10-1-local-10.1.105-418.39/7fa2af80.pub
	apt-get update
	apt-get install -y cuda
	apt-get autoremove nvidia-cuda-toolkit
	echo "export PATH=$PATH:/usr/local/cuda-10.1/bin\${PATH:+:\${PATH}}" | tee -a ~/.bashrc
	source ~/.bashrc

elif [ "$version" = "10.2" ] ; then
#**********************************************************
#*********************Cuda10.2 install*********************
#**********************************************************
	wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda-repo-ubuntu1604-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
	sudo dpkg -i cuda-repo-ubuntu1604-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
	sudo apt-key add /var/cuda-repo-10-2-local-10.2.89-440.33.01/7fa2af80.pub
	apt-get update
	apt-get install -y cuda
	apt-get autoremove nvidia-cuda-toolkit
	echo "export PATH=$PATH:/usr/local/cuda-10.2/bin\${PATH:+:\${PATH}}" | tee -a ~/.bashrc
	source ~/.bashrc
fi


#******************************************************
#*********************Cudnn intall*********************
#******************************************************

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id="${cudnnDownloadlink["$cudnnVersion"_"$version"]}"" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id="${cudnnDownloadlink["$cudnnVersion"_"$version"]}"" -O "Cudnn"$cudnnVersion"_cuda"$version"" && rm -rf /tmp/cookies.txt

unzip "Cudnn"$cudnnVersion"_cuda"$version""
chmod +x ""$cudnnVersion"+cuda"$version".deb"
chmod +x "dev_"$cudnnVersion"+cuda"$version".deb"
chmod +x "doc_"$cudnnVersion"+cuda"$version".deb"
dpkg -i ""$cudnnVersion"+cuda"$version".deb"
dpkg -i "dev_"$cudnnVersion"+cuda"$version".deb"
dpkg -i "doc_"$cudnnVersion"+cuda"$version".deb"

rm "Cudnn"$cudnnVersion"_cuda"$version""
rm ""$cudnnVersion"+cuda"$version".deb"
rm "dev_"$cudnnVersion"+cuda"$version".deb"
rm "doc_"$cudnnVersion"+cuda"$version".deb"
rm cuda-repo*

#********************************************************
#*********************install opencv*********************
#********************************************************
apt-get update -y
apt-get upgrade -y
apt-get install -y qt5-default
apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
apt-get install -y python3.5-dev python3-numpy libtbb2 libtbb-dev
apt-get install -y libjpeg-dev libpng-dev libtiff5-dev libjasper-dev libdc1394-22-dev libeigen3-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common libtbb-dev yasm libfaac-dev
apt-get install -y libopencore-amrnb-dev libopencore-amrwb-dev libopenexr-dev libgstreamer-plugins-base1.0-dev libavutil-dev libavfilter-dev libavresample-dev
wget -O opencv_${openVersion}.zip https://github.com/opencv/opencv/archive/${openVersion}.zip
wget -O opencv_contrib_3.4.7.zip https://github.com/opencv/opencv_contrib/archive/${openVersion}.zip
unzip opencv_${openVersion}.zip
unzip opencv_contrib_${openVersion}.zip
rm opencv_${openVersion}.zip
rm opencv_contrib_${openVersion}.zip
cd opencv-${openVersion}
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D ENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=1 -D BUILD_TIFF=ON -D WITH_CUDA=ON -D WITH_CUBLAS=1 -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-${openVersion}/modules ..

make -j$(nproc)
make install
ldconfig
echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig" | sudo tee -a /etc/bash.bashrc
echo "export PKG_CONFIG_PATH" | sudo tee -a /etc/bash.bashrc
source /etc/bash.bashrc
pkg-config opencv --modversion
cd ~
reboot