class Hash
	# Add an alias for merge to plus, and merge! to plus!
	alias plus merge
	alias plus! merge!
	alias and merge
	alias and! merge!

	# This hash WITHOUT the key-val pairs
	# specified by *keys, taking an optional block
	# that is yielded for each key given
	def without *keys_, &block
		dup.without! *keys_, &block
	end
	def without! *keys_
		keys_.each do |k|
			self.delete(k)||self.delete(k.to_sym)
			yield k if block_given?
		end
		self
	end
	alias not without
	alias not! without!
	alias except without
	alias except! without!
	alias minus without
	alias minus! without!
	alias delete_n without
	alias delete_n! without!

	# This hash with ONLY the key-val pairs
	# specified by *keys, taking an optional block
	# that is yielded for each key given
	def only *keys_, &block
		dup.only! *keys_, &block
	end
	def only! *keys_
		keys.each do |k|
			(delete k unless keys_.include?(k) || (keys.include?(k.to_sym) if k.respond_to? :to_sym)) ? 
        (nil) : (delete(k.to_sym) unless keys_.include? k)
			yield k if block_given?
		end
		self
	end
	alias with_only only
	alias with_only! only!
	alias with only
	alias with! only!

	# only() - with a default value set if the key wasn't present beforehand
	def only_default *keys_, &block
		dup.only_default! *keys_, &block
	end
	def only_default! *keys_
		only! *keys_
		keys_.each do |k|
			self[k] = default unless keys.include? k
		end
		self
	end
	alias with_default only_default
	alias with_default! only_default!

  def union_by_keys h
    if self.respond_to? 'symbolize_keys'
      ukeys = symbolize_keys.keys & h.symbolize_keys.keys
      merge h.only(ukeys)
    else 
      ukeys = keys & h.keys
      merge h.only(ukeys)
    end
  end
end

# TEST
=begin
puts shoppingCart = {
	eggs: true, bacon: true,
	rice: false, waffles: false
}
puts shoppingCart.without(:bacon, :eggs) {|k| puts "No more #{k}!"}
puts shoppingCart
puts shoppingCart.without!(:rice, :bacon) {|k| puts "I don't need #{k}."} # Remove the un-necessities
puts shoppingCart
puts

puts newCart = {
	gum: 'yep', onions: 'need', bell_pepper: 'next aisle',
	grapes: 'love<3', peas: 'green', oranges: 'orange'
}
puts newCart.not(:onions) {|k| puts "Not #{k}!"}
puts newCart.except(:peas, :gum) {|k| puts "#{k} is too expensive..."}
puts newCart.minus!(:waffles) #Doesn't exist
puts newCart
puts newCart.only(:bacon, :eggs, :peas, :oranges) { |k| puts "I only need #{k}" }
puts newCart
puts newCart.with!(:peas, :onions, :grapes)
puts newCart
puts

puts nNewCart = {peas: 1, carrots: 2, string_beans: 'ewww', cereal: '$2.99'}
nNewCart.default= 50
puts nNewCart.only_default :peas, :beans, :cucumbers
puts nNewCart
puts nNewCart.only_default! :rice, :potatoes, :cereal, :lettuce, :peas
puts nNewCart
=end

