class Array

  private
  alias_method :_plus, :+
  alias_method :_minus, :-
  #_plus = instance_method :+
  #_minus = instance_method :-
  #define_method :_plus do |a|
  #  _plus.bind(self).(a)
  #end
  #define_method :_minus do |a|
  #  _minus.bind(self).(a)
  #end

  public
  alias copy dup

  # Should return a deep copy of this array.
  #def clone
  #  Marshal.load Marshal.dump( self )
  #end
  alias deep_dup clone
  alias deep_copy clone

  alias intersect &

  # Old + method
  #alias _plus +
  # Allows for you to do + with a single element
  def + element_or_array
    if element_or_array.is_a? Array
      _plus element_or_array
    else
      deep_dup.push element_or_array
    end
  end
	alias union +
	alias union! <<

  #alias _minus -
  # Allows for you to do - with a single element
  def - element_or_array
    if element_or_array.is_a? Array
      _minus element_or_array
    else
      _copy = deep_dup
      _copy.delete element_or_array
      _copy
    end
  end

	alias random sample

  # Returns true if at least one element (including nested
  # elements) matches the regexp.
  def one_matches regexp
    regexp = Regexp.new(regexp) unless regexp.instance_of? Regexp
    flatten.each do |el|
      return true if regexp =~ el.to_s
    end
    false
  end

  # Returns the first match of the regexp (including nested
  # elements), or nil if not found.
  def first_match regexp
    regexp = Regexp.new(regexp) unless regexp.instance_of? Regexp
    flatten.each do |el|
      return el if regexp =~ el.to_s
    end
    nil
  end

  # Returns the last match of the regexp (including nested
  # elements), or nil if not found.
  def last_match regexp
    self.dup.reverse.first_match regexp
  end

  alias index_of index
  alias last_index rindex
  alias last_index_of rindex

end

# TEST
# puts [1,  3,  4].intersect [5, 6, 7, 8, 1, 4, 9]
#a = [1, 2, 3, 4, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100]
#puts a.union (5...90).to_a
#puts
#puts a
#puts
#puts a.union! (100..120).to_a
#puts
#puts a
