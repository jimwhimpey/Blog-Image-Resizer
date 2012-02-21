require 'mini_magick'
require './ftp.rb'

# Define sizes
small = "500"
large = "1200"

# Define output directory
output_dir = "/Users/jimwhimpey/Desktop/"

# Grab the image
if (ARGV[0] != nil) then
	path = ARGV[0]
	image = MiniMagick::Image.open(path)
else
	p "You must pass in an image path"
end

# Check if there's an image title option
if (ARGV[1] != nil) then
	title = ARGV[1].gsub(/\s/,"-")
else
	title = Time.now.to_i.to_s
end

# Do the large resizing (if it's wider than the large)
if (image[:width] > large.to_i) then
	image.resize(large)
end
image.write(output_dir + title + "-large." + image[:format].downcase)

# Do the small resizing (if it's wider than the small)
if (image[:width] > small.to_i) then
	image.resize(small)
end
image.write(output_dir + title + "-small." + image[:format].downcase)
