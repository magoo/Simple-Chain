require 'json'
require 'digest'
require 'colorize'

#Blockchain file
filename = "block.chain"

#Genesis Data
block_data = 
        { 
          "previous" => 0x00, 
          "nonce" => 1, 
          "message" => "" 
        }

block = { 
          "hash" => "",
          "data" => block_data
        }
blockchain = {}


if(File.exists?(filename)) 
  File.delete(filename)
end

puts
puts "Simple Chain builds a blockchain of messages.".black.on_white

while true do

  #This blockchain has one feature: a message!
  puts "Type a message for this block: (or \"end\")\n".green
  print " > ".green
  block_data["message"] = gets.chomp

  if(block_data["message"] == "end")  
    #write file
    puts JSON.pretty_generate(blockchain)

    File.open(filename, "a") do |f|
      f.puts blockchain.to_json
    end
    
    exit
  end

  print "Mining...".blink

  #Our blockchain requires new blocks to discover four zeroes in the hash.
  #You could say that our our difficulty is "4"
  #The nonce changes rapidly and brute forces a hash that meets this challenge.
  while (!(/^0000/.match(Digest::SHA256.hexdigest(block.to_json)))) do
    block_data["nonce"] = rand()
  end
  puts " mined.".yellow
  #We have found a hash with 4 zeros, and are storing it as our "block hash". This is a unique key to that block in the blockchain.
  block["hash"] = Digest::SHA256.hexdigest(block_data.to_json)
  block["data"] = block_data

  #Add to the  blockchain
  blockchain[block["hash"]] =
         {
          "previous" => block_data["previous"],
          "nonce" => block_data["nonce"],
          "message" => block_data["message"]
        }

  #Prepare the next block
  block_data["previous"] = block["hash"]

end
