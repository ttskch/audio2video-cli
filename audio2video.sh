#!/bin/bash

# usage.
function usage() {
    cat <<EOS
Usage:
    $0 audio_file [options]

Options:
    --output_format, -o     defaults to "mp4"
    --image_file, -i        path to image file
    --image_color, -c       if "--image_file" isn't set, you can specify the color of auto-generated simple color image. defaults to "black"
    --image_resolution, -r  if "--image_file" isn't set, you can specify the resolution of auto-generated simple color image. defaults to "800x450"
    --frame_rate, -f        defaults to 30

EOS
    exit 0
}

# ensure that there are all required commands.
CMD_NOT_FOUND=0
for CMD in ffmpeg ffprobe convert
do
    type $CMD >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "command not found: $CMD"
        CMD_NOT_FOUND=1
    fi
done
if [ $CMD_NOT_FOUND -eq 1 ]; then
    echo "\nplease ensure that ffmpeg (with toolchain) and imagemagick are installed.\n"
    exit 1
fi

# show usage.
if [ $# -eq 0 ]; then
    usage
fi

# init parameters.
OUTPUT_FORMAT="mp4"
IMAGE_COLOR="black"
IMAGE_RESOLUTION="800x450"
FRAME_RATE="30"

# get the duration of the input audio.
AUDIO_DURATION=`ffprobe -hide_banner -show_entries format=duration "$INFILE_NAME" 2>/dev/null | grep duration= | sed -E "s/duration=([0-9.]+).*/\1/g"`

# get the required number of images.
FRAME_NUM=`echo "$AUDIO_DURATION * $FRAME_RATE" | bc`
FRAME_NUM=`echo $FRAME_NUM | sed -E "s/\.[0-9]+$//g"` # round.

# create blank images.
TMP_DIR_PATH=~/tmp/audio2movie_`date +%s`
mkdir $TMP_DIR_PATH && cd $_
convert -size $IMAGE_RESOLUTION xc:$IMAGE_COLOR origin.jpg
for i in `seq -f %06g 1 $FRAME_NUM`
do
    cp origin.jpg $i.jpg
done
cd -

OUTFILE_NAME=`echo "$INFILE_NAME" | sed -E "s/\.[^.]+$/.$OUTPUT_FORMAT/"`
ffmpeg -r 30 -i $TMP_DIR_PATH/%06d.jpg -i "$INFILE_NAME" -r 30 -vcodec libx264 -pix_fmt yuv420p "$OUTFILE_NAME"

rm -rf $TMP_DIR_PATH
