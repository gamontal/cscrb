require_relative "caesar-cipher"
class CaesarTest
  include CaesarCipher
end

ct = CaesarTest.new

print "Type 1 to encrypt or 2 to decrypt a message: "
resp = gets.chomp.to_i

case resp
when 1
  print "\nShift key: "
  key = gets.chomp
  
  puts "\nEnter your message below:"
  print "> "
  message = gets.chomp
  
  ciphertext = ct.encrypt(key, message)
  puts "\nCiphertext: " + ciphertext

when 2
  print "\nShift key: "
  key = gets.chomp

  puts "\nEnter the ciphertext below:"
  print '> '
  ciphertext = gets.chomp

  message = ct.decrypt(key, ciphertext)
  print "\nPlaintext: " + message + "\n\n"
else
  print "\ninvalid command\n\n"
end



