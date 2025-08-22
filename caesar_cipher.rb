print ("What is your note?: ")
string = gets.chomp

print ("What is your shift?: ")
shift = gets.chomp.to_i

def caesar_cipher string, shift
	upper_alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
	lower_alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
	shift_factor = 0
	out_array = []

	string.split('').each do |letter|
		index = nil
		min = -25
		max = 25

		if upper_alphabet.include?(letter) || lower_alphabet.include?(letter)
			index = upper_alphabet.index(letter) || lower_alphabet.index(letter)
		else
			out_array.push(letter)
			next
		end
		shift_factor = index + shift.clamp(min, max)
		if upper_alphabet.include?(letter)
			if shift.negative?
				out_array.push(upper_alphabet[shift_factor])
			else
				out_array.push(upper_alphabet[shift_factor - 26])
			end
		else
			if shift.negative?
				out_array.push(lower_alphabet[shift_factor])
			else
				out_array.push(lower_alphabet[shift_factor - 26])
			end
		end
 	end
	out_array.join
end

puts caesar_cipher(string, shift)
