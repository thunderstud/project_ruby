# substrings

# take a word or words as first argument
# 


def substrings(words, dictionary)
	subs = Hash.new(0)
	words.split(/\W+/).each do |word|
		dictionary.each do |substring|
			subs[substring] += 1 if word[substring]
		end
	end
	subs
	#need something = value[0..-1]
end

dictionary = ["test", "go", "this", "is", "how", "cat"]

puts substrings("This is a test", dictionary).inspect

# Hash[array.each_with_index.map { | value, index | [index, value] }]
# => {0=> "Adult", 1=>"Family", 2=>"Single", 3=>"Child"}

# Hash[array.map.with_index { |value, index| [index, value] }]
# => {0=> "Adult", 1=>"Family", 2=>"Single", 3=>"Child"}