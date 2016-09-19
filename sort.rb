


reads = [];

File.readlines('huya.txt').each do |line|

reads.push(line.split)

	arrays = line.split
	file = arrays[7]
puts line
	if file.end_with?("png") || file.end_with?("car") || file.end_with?("gif")
		imageSize += arrays[2].to_i
		# puts(arrays[2] + "     " + arrays[7])
	elsif file.end_with?("plist")
		plistSize += arrays[2].to_i
	elsif file.end_with?("kiwi")
		kiwiSize = arrays[2].to_i
	elsif file.end_with?("nib")
		xibSize += arrays[2].to_i
	end
	
end

sort = reads.sort { |a, b| b[2].to_i <=> a[2].to_i }

sort.each { |e|

	s = "%.2f" % (e[2].to_f/1024/1024)
	puts(s + "  #{e[2]}	#{e[7]}")
}