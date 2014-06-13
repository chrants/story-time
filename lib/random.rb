# Returns a number >= min, but <= max
def random min, max
	rand(max - min) + min
end

def rand_bool
	random(0, 2) == 1
end

# Returns a random upper or lowercase letter
def rand_let
	uppercase = rand_bool
	uppercaseLet = random(65, 91).chr
	letter = (uppercase) ? (uppercaseLet) : (uppercaseLet.downcase)
	letter
end

def rand_word options={length: {min: 3, max: 10}}
	length = options[:length]
	l = random length[:min], (length[:max] + 1)
	word = ''
	l.times do
		word << rand_let
	end
	(rand_bool) ? (word.downcase) : (word.capitalize)
end

# Returns a random phone number w/ an area code of 210 (no international prefixes)
def rand_phone
	"210#{random(1111111, 9999999).to_s}"
end

def rand_email
	"#{rand_word length: {min: 4, max: 10}}@#{rand_word length: {min: 3, max: 10}}.#{rand_word length: {min: 2, max:3}}"
end

# Gets a random 40 character string consisting of uppercase and lowercase
# letters and numbers 0-9
def rand_token length=40
	token = ''
	length.times do
		token += (random(0, 2)==1) ? (random(0,10).to_s) : (rand_let())
	end
	token
end

def rand_instance dm_model
	dm_model.all.random
end

alias :sample_instance :rand_instance