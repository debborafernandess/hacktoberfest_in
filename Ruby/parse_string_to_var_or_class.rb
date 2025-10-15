# Methods definitions

def transform(text, choice)
  case choice
  when 1
     puts to_camel_case(text)
  when 2
      puts classify(text)
  else
      puts text
  end
end

# This works for:
# String        -> string
# StringString  -> string_string
# String String -> string_string
# String 0 StriNG -> string_0_string
def to_camel_case(text)
  text.downcase.gsub(" ", "_")
end

# This works for:
# string        -> String
# string_string  -> StringString
# string String -> StringString
# string 0 string -> String0String
def classify(text)
  words = text.gsub(/[\s]+/, "_").split("_")

  words.map(&:to_s).map(&:capitalize!)

  words.join
end

puts "Give us a string to normalize"
text = gets.chomp

choices = <<STR

What do you want to do? ( pic a number)
  - [1] Transform to camel_case
  - [2] Transform to class name
STR

puts choices
choice = gets.chomp.to_i

transform(text, choice)

