

files = []
sections = []
symbols = []


current = files

File.readlines('kiwi-LinkMap-normal-arm64.txt').each do |line|
    
#    puts line

    if line.start_with?("# Symbols:")
        
        current = symbols
        

    else
        
        begin
        	a = line.split
            current.push(a)

            # if a.count < 3
            # 	puts line
            	
            # end
        rescue ArgumentError => bang
            # puts "Error running script: " + line
        end
    end
    
end


def sizeOfLib(libName, symbols, files)

sdkSize = 0.0

symbols.each { |sys|
    
    begin
    
    if sys[2] == "["
        
        fileLine = sys[3].delete("]").to_i
        
        else
        
        fileLine = sys[2].delete("[]]").to_i
        
    end

fileName = files[fileLine].last

# puts fileName
# libyyprotosdk
# Bugly

if fileName.include?(libName)
	
	sdkSize += sys[1].to_i(16)
end

    rescue ArgumentError, NoMethodError => bang
    # puts sys.count
    end
}

s = sdkSize/1024/1024

puts  libName + "  " + s.to_s 

end

# "libyyprotosdk", "ffmpeg", "libUMSocial", "UMengFeedback", 
    # "ibGPUImage", "libcrypto", "libdwwupkit", "libkiwisdk", 
    # "Objects-normal", "libAFNetworking", "libHiidoSDK", "libJSPatch", "libcurl", "libmediatrans", "SDW", "YYText", "libopencore", "Facebook", "UmengSocialCOM", "libWeiboSDK",
libs = ["HUYA", "MLive"]

libs.each { |lib|
sizeOfLib(lib, symbols, files)
  }


# ["[", "11]", "/Users/liyipeng/Library/Developer/Xcode/DerivedData/kiwi-axpanwmzivayuzdaecjrgszqurhv/Build/Intermediates/kiwi.build/Debug-iphoneos/kiwi.build/Objects-normal/arm64/YYMyInfoHistoryCell.o"]

# ["0x100005C24", "0x0000004C", "[", "1]", "-[DiscoveryPanelFansItem", "setUserName:]"]
# ["0x10000A9FC", "0x0000004C", "[", "4]", "-[MLiveShowCell", "setLocationLabel:]"]
# ["0x1019A3840", "0x00000010", "[3002]", "_uniforms"]

# print files[10]
# puts " aaa"





#puts current[2].count
#
#print files[10].count