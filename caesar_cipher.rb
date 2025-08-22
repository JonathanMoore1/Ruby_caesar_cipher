def caesar_cipher string, shift
	alphabet = []
	shift_factor = ""
	
	cipher = 'a'.ord

	string.split('').each do |letter|
		if letter =~ /[^a-zA-Z]/
			alphabet.push letter.bytes.join('').to_i
		else
			shifted_string = letter.downcase.bytes.join('').to_i + shift
			alphabet.push (shifted_string - cipher) % 26 + cipher
		end
	end
	shift_factor = alphabet.pack 'C*'
	shift_factor.capitalize
end

puts caesar_cipher("What a string!", 5)
