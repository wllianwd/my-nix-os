#/bin/sh

echo "Copying photos from camera"

pushd ~/Pictures/camera
echo "Listing devices"
gphoto2 --list-ports
echo "Auto detecting"
gphoto2 --auto-detect
echo "Copying files into ~/Pictures/camera"
gphoto2 --get-all-files --skip-existing
popd
