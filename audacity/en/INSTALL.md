* Rev.2: 2024-09-15 (Sun)
* Rev.1: 2020-06-24 (Wed)
* Draft: 2019-03-04 (Mon)

# Install Audacity

```bash
$ sudo apt install audacity
```

# Install FFmpeg and lame
```bash
$ sudo apt install ffmpeg lame
```

## FFmpeg
- FFmpeg allows you import/export additional audio file formats into/from Audacity.
  - For example, M4A and WMA.
- FFmpeg cannot be distributed with Audacity itself due to patent restrictions.

## LAME
LAME is required to export MP3 files. 
- It is now included with Audacity by default on Windows and macOS, but not on Linux.
- If you're getting any LAME errors on Windows and macOS, make sure you are using the latest version of Audacity.

source: Audacity Support > [Installing FFmpeg](https://support.audacityteam.org/basics/installing-ffmpeg)
