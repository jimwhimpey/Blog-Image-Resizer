# A Very Simple Ruby Command Line Image Resizer

Takes a local image path and (optionally a title), creates a small version, creates a larger version, uploads them via FTP, returns markdown of the little smaller linking to the larger image, automatically copies it to your pasteboard.

## Usage

1. Download this thing.
2. Modify the config and rename it `config.rb`
3. Run `ruby resize.rb /path/to/image.png "title of image"`
4. Wait for the files to upload.
5. Markdown is now copied to your pasteboard. 

## Output

`[![1329819405](http://static.jimwhimpey.com/blog/1329819405-small.png)](http://static.jimwhimpey.com/blog/1329819405-large.png)`

## Requirments

* [ImageMagick](http://www.imagemagick.org/script/index.php)
* [MiniMagick](https://github.com/probablycorey/mini_magick)

## Caveats

* Pasteboard copy only works on Mac OS
* *Very* little error checking, hastily thrown together
