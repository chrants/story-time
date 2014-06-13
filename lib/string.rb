class String

	# Returns true if this string matches one of an
	# array of regexps.
	def matches_one *regexp
		regexp.flatten.each do |regex|
			return true if Regexp.new(regex.to_s) =~ self
		end
		false
	end

	# Allows everything seperated by a space to be
	# split into a string, with an optional mapping
	# of :as_is, :capitalize, :downcase, or :upcase.
	# Default mapping is :as_is.
	def words *options
		#options=[:as_is] unless options
		words_ = split /\s+/
		options.each do |op|
			case op.to_sym
			when :as_is;
			when :capitalize
				words_.count.times do |n|
					words_[n-1].capitalize!
				end
			when :downcase
				words_.count.times do |n|
					words_[n-1].downcase!
				end
			when :upcase
				words_.count.times do |n|
					words_[n-1].upcase!
				end
			else;
			end
		end
		words_
	end

	# Returns a list of items; seperates by the
	# regexp /\s*\,\s*/
	def list_items
		list = split /\s*\,\s*/
		list.each do |li|
			list.delete li if li == ''
		end
		list
	end

	alias add +

	# A gsub replacement for the regexp to ''
	def - regexp
		gsub regexp, ''
	end
	# A sub replacement for the regexp to ''
	def minus regexp
		sub regexp, ''
	end
	alias minus_all -

	# Returns the char at n
	def char_at n
    self[n]
  end
  alias nth_char char_at

	alias index_of index
	alias last_index rindex
	alias last_index_of rindex
end

# TEST
=begin
count = '1 2 3 4 5 6 7 8 9 10'
puts count.words
puts count.words.inspect
puts count
puts

list = ',,,,Sam, Pam, Henry, I,'
puts list.list_items
puts list.list_items.inspect
puts list
puts list.words :downcase

puts list.add count
puts count.minus '1'
puts list - 'Sam'
=end