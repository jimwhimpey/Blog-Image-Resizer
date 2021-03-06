require 'net/ftp'
require 'mini_magick'
require './config.rb'

# Grab the image
if (ARGV[0] != nil) then
	local_path = ARGV[0]
	image = MiniMagick::Image.open(local_path)
else
	p "You must pass in an image path"
	return
end

# Check if there's an image title option
if (ARGV[1] != nil) then
	title = ARGV[1].gsub(/\s/,"-")
else
	title = Time.now.to_i.to_s
end

# Check if there's a class
if (ARGV[2] != nil) then
	class_name = ARGV[2]
end

# Filenames and paths
large_name = title + "-large." + image[:format].downcase
small_name = title + "-small." + image[:format].downcase
large_path = $tmp_dir + large_name
small_path = $tmp_dir + small_name

# Do the large resizing (if it's wider than the large)
if (image[:width] > $size_large.to_i) then
	image.resize($size_large)
end
image.write(large_path)

# Do the small resizing (if it's wider than the small)
if (image[:width] > $size_small.to_i) then
	image.resize($size_small)
end
image.write(small_path)

# FTP Upload the file
ftp = Net::FTP.new
ftp.connect($ftp_host)
ftp.login($ftp_username,$ftp_password)
ftp.chdir($ftp_path)
ftp.putbinaryfile(large_path, large_name)
ftp.putbinaryfile(small_path, small_name)
ftp.quit

# Delete the temporary files
File.delete(large_path)
File.delete(small_path)

# Output the markdown and copy it to the clipboard
html = "<a href='" + $http_path + "/" + large_name + "'><img src='" + $http_path + "/" + small_name + "' alt='" + title.gsub("\-", " ") + "' "
if (class_name != nil) then
	html += "class='" + class_name + "' "
end
html += "/></a>"
IO.popen('pbcopy', 'r+') { |clipboard| clipboard.puts html }
print "========================================================\n"
print "The following HTML has been copied to your clipboard\n\n"
print html + "\n\n"
print "========================================================\n"
