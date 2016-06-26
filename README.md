# audio2video-cli

Convert an audio file to a simple color video file.  
Maybe it's useful for attaching just audio to your **tweet** :wink: (We cannot attach audio file but can do video file.)

## Requirements

* PHP 5.4+
* ffmpeg (with toolchain)
* imagemagick
* php-imagick

```sh
# e.g. for Mac.
$ brew install ffmpeg --with-tools
$ brew install imagemagick php54-imagick

# e.g. for Ubuntu 16.04.
$ apt-get install -y ffmpeg libavcodec-extra imagemagick php-imagick
```

## Installation

```sh
$ git clone git@github.com:ttskch/audio2video-cli.git
$ cd audio2video-cli
$ composer install
$ ln -s $(pwd)/audio2video /usr/local/bin/
```

## Usage

```
$ audio2video conv --help
Usage:
  conv [options] [--] <audio-file>

Arguments:
  audio-file                               path to audio file

Options:
  -o, --output-format=OUTPUT-FORMAT        defaults to "mp4"
  -i, --image-file=IMAGE-FILE              path to image file
  -c, --image-color=IMAGE-COLOR            if "--image_file" isn't set, you can specify the color of auto-generated simple color image. defaults to "black"
  -r, --image-resolution=IMAGE-RESOLUTION  if "--image_file" isn't set, you can specify the resolution of auto-generated simple color image. defaults to "800x450"
  -f, --frame-rate=FRAME-RATE              defaults to 30
  -w, --overwrite                          if you set this flag, existing video file which has output target filename will be overwritten
  -h, --help                               Display this help message
  -q, --quiet                              Do not output any message
  -V, --version                            Display this application version
      --ansi                               Force ANSI output
      --no-ansi                            Disable ANSI output
  -n, --no-interaction                     Do not ask any interactive question
  -v|vv|vvv, --verbose                     Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug

Help:
 Convert audio file to simple video file
```

### Examples

```sh
$ audio2video conv sample.mp3
$ audio2video conv sample.mp3 -o avi
$ audio2video conv sample.mp3 -o avi -i sample.png
$ audio2video conv sample.mp3 -o m4v -c white
$ audio2video conv sample.mp3 -o m4v -c "#123456" -r 1600x900
$ audio2video conv sample.mp3 -o m4v -c white -r 1600x900 -f 15
```

For example, when you input a mp3 file like below:

![image](https://cloud.githubusercontent.com/assets/4360663/16361302/6cd60b90-3bc6-11e6-8b16-950d76991ed4.png)

And exec command below:

```sh
$ audio2video conv sample.mp3
/path/to/current/sample.mp4 is generated successfully.
```

Then you get mp4 file like below:

![image](https://cloud.githubusercontent.com/assets/4360663/16361272/71a89288-3bc5-11e6-89fa-ebf0c46bdc54.png)

## See also

This feature **as a service** is here:

* http://audio2video.me
* [ttskch/audio2video](https://github.com/ttskch/audio2video)
