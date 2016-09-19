
s = 0;

File.readlines('sections.txt').each do |line|



	array = line.split
	size = array[1].to_i(16).to_f/1024/1024
puts size.to_s + "           " + array[3]

s += size
	
end

puts s