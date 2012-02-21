# A Very Simple Ruby Command Line Image Resizer

Takes a local image path and (optionally a title), creates a small version, creates a larger version, uploads them via FTP, returns markdown of the little smaller linking to the larger image, automatically copies it to your pasteboard.

Handles any image type ImageMagick will take. Smart enough to not resize images *up* if they're not big enough but that's where the smart ends. This is a little tool for me to fill a gap [I see](http://valhallaisland.com/blog/2012/octopress/) in the otherwise brilliant [Octopress](http://octopress.org/) blogging software. I hope someone else can also find it useful in some capacity.

## Usage

1. Download this thing.
2. Modify the config and rename it `config.rb`
3. Run `ruby resize.rb /path/to/image.png "title of image"`
4. Wait for the files to upload.
5. Markdown is now copied to your pasteboard. 

## Example Output

`[![1329819405](http://static.jimwhimpey.com/blog/1329819405-small.png)](http://static.jimwhimpey.com/blog/1329819405-large.png)`

## Requirments

* [ImageMagick](http://www.imagemagick.org/script/index.php)
* [MiniMagick](https://github.com/probablycorey/mini_magick)

## Caveats

* Pasteboard copy only works on Mac OS
* *Very* little error checking, hastily thrown together
