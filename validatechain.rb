require 'json'
require 'digest'
require 'colorize'

filename = "block.chain"
data = File.read(filename)
blockchain = JSON.parse(data)

#Store the previous hash for comparison
previous = ""

#Overall fail state
verified = true

blockchain.each do |block|

  if((Digest::SHA256.hexdigest (block[1].to_json)) == block[0]) then
    
    if(previous == "") then
      puts "#{block[0][0..4].green} (genesis) verified.";
    elsif (block[1]["previous"] != previous)
      verified = false
      puts "#{block[0][0..4].red} does not reference previous block. Chain broken."
    else 
      puts "#{block[0][0..4].green} verified."
    end

  else
    puts "#{block[0][0..4].red} failed!"
    verified = false
  end

  previous = block[0]

end

if verified then
  puts "Chain verified".green
else puts "Chain failed".red
end
