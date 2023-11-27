echo "####" 
echo Using config file /home/nadeem/KATHPRFI_LBAND/RDB_FILES/kathprfi_config_SCI_Imaging_L_2021-02-01_2021-02-28_HH.txt...
echo "####"
docker run -it --rm --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/:/host:rw" --volume="/data3/nadeem/GitHub:/home/nadeem/GitHub:rw" --volume="/data3/nadeem/rfi-chronicles:/home/nadeem/rfi-chronicles:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/RDB_FILES:/home/nadeem/KATHPRFI_LBAND/RDB_FILES:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/FLAG_FILES:/home/nadeem/KATHPRFI_LBAND/FLAG_FILES:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/OUT_ZARR:/home/nadeem/KATHPRFI_LBAND/OUT_ZARR:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/GOOD_FILES:/home/nadeem/KATHPRFI_LBAND/GOOD_FILES:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/BAD_FILES:/home/nadeem/KATHPRFI_LBAND/BAD_FILES:rw" --volume="/tmp:/home/nadeem:rw" -e HOME="/home/nadeem" --user=1661 --net=host -e QT_X11_NO_MITSHM=1 -e DISPLAY=localhost:10.0 --volume="/home/nadeem/.Xauthority:/home/nadeem/.Xauthority" --volume="/home/nadeem/.Xdefaults:/home/nadeem/.Xdefaults" --name DOCKER_NAME_POL kathprfidocker python3 /home/nadeem/GitHub/kathprfi/script/kathprfi_script.py -c /home/nadeem/KATHPRFI_LBAND/RDB_FILES/kathprfi_config_SCI_Imaging_L_2021-02-01_2021-02-28_HH.txt -z /home/nadeem/KATHPRFI_LBAND/OUT_ZARR/Lband_HH_.zarr -b /home/nadeem/KATHPRFI_LBAND/BAD_FILES/bad_files_Lband_HH_2021FebSci.npy -g /home/nadeem/KATHPRFI_LBAND/GOOD_FILES/good_files_Lband_HH_2021FebSci.npy
echo "###"
echo Using config file /home/nadeem/KATHPRFI_LBAND/RDB_FILES/kathprfi_config_SCI_Imaging_L_2021-02-01_2021-02-28_VV.txt...
echo "###"

docker run -it --rm --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/:/host:rw" --volume="/data3/nadeem/GitHub:/home/nadeem/GitHub:rw" --volume="/data3/nadeem/rfi-chronicles:/home/nadeem/rfi-chronicles:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/RDB_FILES:/home/nadeem/KATHPRFI_LBAND/RDB_FILES:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/FLAG_FILES:/home/nadeem/KATHPRFI_LBAND/FLAG_FILES:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/OUT_ZARR:/home/nadeem/KATHPRFI_LBAND/OUT_ZARR:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/GOOD_FILES:/home/nadeem/KATHPRFI_LBAND/GOOD_FILES:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/BAD_FILES:/home/nadeem/KATHPRFI_LBAND/BAD_FILES:rw" --volume="/tmp:/home/nadeem:rw" -e HOME="/home/nadeem" --user=1661 --net=host -e QT_X11_NO_MITSHM=1 -e DISPLAY=localhost:10.0 --volume="/home/nadeem/.Xauthority:/home/nadeem/.Xauthority" --volume="/home/nadeem/.Xdefaults:/home/nadeem/.Xdefaults" --name DOCKER_NAME_POL kathprfidocker python3 /home/nadeem/GitHub/kathprfi/script/kathprfi_script.py -c /home/nadeem/KATHPRFI_LBAND/RDB_FILES/kathprfi_config_SCI_Imaging_L_2021-02-01_2021-02-28_VV.txt -z /home/nadeem/KATHPRFI_LBAND/OUT_ZARR/Lband_VV_.zarr -b /home/nadeem/KATHPRFI_LBAND/BAD_FILES/bad_files_Lband_VV_2021FebSci.npy -g /home/nadeem/KATHPRFI_LBAND/GOOD_FILES/good_files_Lband_VV_2021FebSci.npy
echo "###"
echo Using config file /home/nadeem/KATHPRFI_LBAND/RDB_FILES/kathprfi_config_SCI_Imaging_L_2021-02-01_2021-02-28_HV.txt...
echo "###"

docker run -it --rm --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/:/host:rw" --volume="/data3/nadeem/GitHub:/home/nadeem/GitHub:rw" --volume="/data3/nadeem/rfi-chronicles:/home/nadeem/rfi-chronicles:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/RDB_FILES:/home/nadeem/KATHPRFI_LBAND/RDB_FILES:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/FLAG_FILES:/home/nadeem/KATHPRFI_LBAND/FLAG_FILES:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/OUT_ZARR:/home/nadeem/KATHPRFI_LBAND/OUT_ZARR:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/GOOD_FILES:/home/nadeem/KATHPRFI_LBAND/GOOD_FILES:rw" --volume="/data3/nadeem/KATHPRFI_LBAND/BAD_FILES:/home/nadeem/KATHPRFI_LBAND/BAD_FILES:rw" --volume="/tmp:/home/nadeem:rw" -e HOME="/home/nadeem" --user=1661 --net=host -e QT_X11_NO_MITSHM=1 -e DISPLAY=localhost:10.0 --volume="/home/nadeem/.Xauthority:/home/nadeem/.Xauthority" --volume="/home/nadeem/.Xdefaults:/home/nadeem/.Xdefaults" --name DOCKER_NAME_POL kathprfidocker python3 /home/nadeem/GitHub/kathprfi/script/kathprfi_script.py -c /home/nadeem/KATHPRFI_LBAND/RDB_FILES/kathprfi_config_SCI_Imaging_L_2021-02-01_2021-02-28_HV.txt -z /home/nadeem/KATHPRFI_LBAND/OUT_ZARR/Lband_HV_.zarr -b /home/nadeem/KATHPRFI_LBAND/BAD_FILES/bad_files_Lband_HV_2021FebSci.npy -g /home/nadeem/KATHPRFI_LBAND/GOOD_FILES/good_files_Lband_HV_2021FebSci.npy