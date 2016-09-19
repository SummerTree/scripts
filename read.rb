# require "File"
# zipinfo -m kiwi.zip >> huya.txt


imageSize = 0.0;
plistSize = 0.0;
kiwiSize = 0.0;
xibSize = 0.0;
otherSize = 0.0;


File.readlines('kiwi.txt').each do |line|

	arrays = line.split



	# puts arrays

	

	file = arrays[-1]

	size = arrays[3].to_i * (1- arrays[5].to_i/100.0)


	if file.end_with?("png") || file.end_with?("car") || file.end_with?("gif")
		imageSize += size
		# puts(arrays[2] + "     " + arrays[7])
	elsif file.end_with?("plist")
		plistSize += size
	elsif file.end_with?("kiwi")
		kiwiSize = size
	elsif file.end_with?("nib")
		xibSize += size
	else
		otherSize += size
	end
	
end

i = 1024*1024

puts ("图片 #{imageSize/i},	plist #{plistSize/i},	可执行 #{kiwiSize/i},	xib #{xibSize/i}, 其他#{otherSize/i}, 全部#{(imageSize + plistSize + kiwiSize + otherSize)/i}")


# 图片 11.623148450851449,       	plist 0.05167469024658203,     	可执行 28.033955078124997,     	xib 1.2727787971496578, 其他0.23214015007019037, 全部39.94091836929322
# 图片 10.348635292053226,       	plist 0.05088920593261719,     	可执行 27.854667968749997,     	xib 1.2455636978149405, 其他0.2261806392669677, 全部38.48037310600281

#huya 	图片 11.62663013458253,	plist 0.05326519966125488,     	可执行 50.42528991699219,      	xib 1.2816588306426986, 其他1.0371359729766845, 全部63.142321224212665
#YY 	图片 6.667183017730715,	plist 0.017145099639892577,    	可执行 62.288681640625,	xib 1.8765825176239066, 其他1.8352893161773682, 全部70.80829907417298