# audio2video-cli

Convert an audio file to a simple color video file.  
Maybe it's useful for attaching just audio to your **tweet** :wink: (We cannot attach audio file but can do video file.)

## Requirements

* ffmpeg (with toolchain)
* imagemagick

```sh
# e.g. for Mac.
$ brew install ffmpeg --with-tools
$ brew install imagemagick
```

```sh
# e.g. for Ubuntu 16.04.
$ apt-get install -y ffmpeg libavcodec-extra imagemagick
```

## Installation

```sh
$ git clone git@github.com:ttskch/audio2video-cli.git
$ cd audio2video-cli
$ ln -s $(pwd)/audio2video.sh /usr/local/bin/a2v
```

## Usage

```
$ a2v
Usage:
    /usr/local/bin/a2v audio_file [options]

Options:
    --output_format, -o     defaults to "mp4"
    --image_file, -i        path to image file
    --image_color, -c       if "--image_file" isn't set, you can specify the color of auto-generated simple color image. defaults to "black"
    --image_resolution, -r  if "--image_file" isn't set, you can specify the resolution of auto-generated simple color image. defaults to "800x450"
    --frame_rate, -f        defaults to 30
```

### Examples

```sh
$ a2v sample.mp3
$ a2v sample.mp3 -o avi
$ a2v sample.mp3 -o avi -i sample.png
$ a2v sample.mp3 -o m4v -c white
$ a2v sample.mp3 -o m4v -c "#123456" -r 1600x900
$ a2v sample.mp3 -o m4v -c white -r 1600x900 -f 15
```

For example, when you input a mp3 file like below:

![image](https://cloud.githubusercontent.com/assets/4360663/16177540/d324a592-366b-11e6-9ef6-7a9601a8ac3f.png)

And exec command below:

```sh
$ a2v sample.mp3
```

Then you'll get mp4 file like below:

![image](https://cloud.githubusercontent.com/assets/4360663/16177559/637ab9b0-366c-11e6-95fb-e5273951e2a9.png)

Enjoy it :smiley:
