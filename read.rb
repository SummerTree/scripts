# require "File"



imageSize = 0.0;
plistSize = 0.0;
kiwiSize = 0.0;
xibSize = 0.0;


File.readlines('douyu.txt').each do |line|

	arrays = line.split
	file = arrays[7]

	if file.end_with?("png") || file.end_with?("car") || file.end_with?("gif")
		imageSize += arrays[2].to_i
		# puts(arrays[2] + "     " + arrays[7])
	elsif file.end_with?("plist")
		plistSize += arrays[2].to_i
	elsif file.end_with?("DYZB")
		kiwiSize = arrays[2].to_i
	elsif file.end_with?("nib")
		xibSize += arrays[2].to_i
	end
	
end

i = 1024*1024

puts ("图片 #{imageSize/i},	plist #{plistSize/i},	可执行 #{kiwiSize/i},	xib #{xibSize/i}")