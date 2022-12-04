vowels = ["a", "e", "u", "i", "o", "y"]
puts hash_alphabet = ("a".."z").to_a.map.with_index { |let, idx| [let, idx + 1] if vowels.include?(let) }.compact!.to_h.inspect
\n
