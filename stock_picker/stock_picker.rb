# each day has 1 stock price
# 7 days per week
# days start at 0
# must buy before selling
# want the biggest positive spread

# find the highest spread between lowest and highest
# if the low day is after the high day, 
# => keep searching pairs until low day is after high day

# first, assign each daily stock price into an array

# [].minmax

# [].min and [].max if I have to
# set array equal to some variable, then use variable.index to find positions

# sort the array
# average the array
# try min and max
# if index of max is after index of min, done
# if not, delete either the min or max, depending on which is closest to average
# => and try to find new min or max

def stock_prices(array)
	largest_difference = 0
	array.each_with_index {| value, index| 
		array.each { |i|
			difference = value - i
			if (difference <= largest_difference) && (index < array.rindex(i))
				negative_array = [] << difference
				negatives = [index, array.rindex(i)]
				largest_difference = difference
			end
			}
		}
		if negative_array.nil?
			puts "Buy/sell [0,1]"
		else
			puts "Buy/sell #{negatives}"
		end
	end

stock_prices = ([3, 6, 774, 24, 56, 2, 64, 45, 34])

puts "hello"
=begin

def stock(stock_prices)
	((0...stock_prices.length).to_a)
	.repeated_permutation(2)
	.select {|start, finish| finish > start}
	.max_by {|start, finish| stock_prices[finish] - stock_prices[start]}
end

=end



# stock_prices.inject{ |sum, n| sum + n }

=begin

while stock_prices.index(stock_prices.max) < stock_prices.index(stock_prices.min) do
	average = stock_prices.inject{ |sum, el| sum + el }.to_f / stock_prices.size
	if (stock_prices.max - average).abs > (stock_prices.min - average).abs
		stock_prices.delete(stock_prices.min)
	else
		stock_prices.delete(stock_prices.max)
	end
end

=end

# puts stock_prices.index(stock_prices.max) - stock_prices.index(stock_prices.min)
=begin

if stock_prices.index(stock_prices.max) > stock_prices.index(stock_prices.min)
	puts stock_prices.max - stock_prices.min
else
	average = stock_prices.inject{ |sum, el| sum + el }.to_f / stock_prices.size
	if (stock_prices.max - average).abs > (stock_prices.min - average).abs
		stock_prices.min.delete
	else
		stock_prices.max.delete
	end

end

=end

=begin
class Array
	def iterate!(code)
		self.each_with_index do |n , i|
			self[i] = code.call(n)
		end
	end
end

stock_prices.iterate!(Proc.new do |n|
	n ** 2
end)

=end