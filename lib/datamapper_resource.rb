#module DataMapper::Model
#	def self.random
#		#all().random
#	end
#	alias_method :sample, :random
#	alias_method :size, :count
#	alias_method :length, :count
#end

def alias_class_method(klass, new_name, old_name)
	klass.define_singleton_method(new_name) { old_name }
end

=begin
DataMapper::Model.define_singleton_method( :random ) do
	all().random
end

alias_class_method(DataMapper::Model, :sample, :random)
alias_class_method(DataMapper::Model, :size, :count)
alias_class_method(DataMapper::Model, :length, :count)
=end