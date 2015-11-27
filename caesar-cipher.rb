# Simple Ruby implementation of the Caesar substitution cipher

$ALPHA = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
module CaesarCipher
  def encrypt(key, plaintext)
    key = key.to_i
    if key != 0
      plaintext = plaintext.downcase
      cAlpha = []
      ctv = [], counter = 0
      ciphertext = ''
      
      $ALPHA.each_with_index do |val, i|
        cAlpha[i] = $ALPHA[(i + key) % 26]
      end
      
      plaintext.each_char do |x|
        $ALPHA.each_with_index do |val, i|
          if x.eql? val
            ctv[counter] = cAlpha[i]
            counter += 1
          elsif x.match(/\s/)
            ctv[counter] = ' '
            counter += 1
            break
          end
        end
      end
      ciphertext = ctv.join()
      return ciphertext
      
    else
      puts "Invalid key"
      return
    end
  end
  
  def decrypt(key, ciphertext)
    key = key.to_i
    if key != 0
      ciphertext = ciphertext.downcase
      cAlpha = []
      ptv = [], counter = 0
      plaintext = ''
      
      $ALPHA.each_with_index do |val, i|
        cAlpha[i] = $ALPHA[(i - key) % 26]
      end
      
      ciphertext.each_char do |x|
        $ALPHA.each_with_index do |val, i|
          if x.eql? val
            ptv[counter] = cAlpha[i]
            counter += 1
          elsif x.match(/\s/)
            ptv[counter] = ' '
            counter += 1
            break
          end
        end
      end
      plaintext = ptv.join()
      return plaintext
    else
      puts "Invalid key"
      return
    end
  end
end
