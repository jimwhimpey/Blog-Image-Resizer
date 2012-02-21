# A Very Simple Ruby Command Line Image Resizer

Takes a local image path and (optionally a title, optionally a class), creates a small version, creates a larger version, uploads them via FTP, returns HTML of the smaller image linking to the larger image, automatically copies it to your pasteboard.

Handles any image type ImageMagick will take. Smart enough to not resize images *up* if they're not big enough but that's where the smart ends. This is a little tool for me to fill a gap [I see](http://valhallaisland.com/blog/2012/octopress/) in the otherwise brilliant [Octopress](http://octopress.org/) blogging software. I hope someone else can also find it useful in some capacity.

## Usage

1. Download this thing.
2. Modify the config and rename it `config.rb`
3. Run `ruby resize.rb /path/to/image.png "optional title of image" "optional-class"` (remember that you can drag and drop files onto the command line to paste in the path).
4. Wait for the files to upload.
5. Output HTML is now copied to your pasteboard. 

## Requirments

* [ImageMagick](http://www.imagemagick.org/script/index.php)
* [MiniMagick](https://github.com/probablycorey/mini_magick)

## Caveats

* Pasteboard copy only works on Mac OS
* *Very* little error checking, hastily thrown together
