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

## Usage

```sh
$ sh audio2video.sh
Usage: sh audio2movie.sh infile [outfile_ext (default: "mp4")] [bg_color (default: "black")] [resolution (default: "1024x576")] [fps (default: 30)]
```

### Examples

```sh
$ sh audio2movie sample.mp3
$ sh audio2movie sample.mp3 avi
$ sh audio2movie sample.mp3 mp4 white
$ sh audio2movie sample.mp3 mp4 white 1600x900
$ sh audio2movie sample.mp3 mp4 white 1600x900 15
```

For example, when you input a mp3 file like below:

![image](https://cloud.githubusercontent.com/assets/4360663/16177540/d324a592-366b-11e6-9ef6-7a9601a8ac3f.png)

then you get mp4 file like below:

![image](https://cloud.githubusercontent.com/assets/4360663/16177559/637ab9b0-366c-11e6-95fb-e5273951e2a9.png)

Enjoy it :smiley:
