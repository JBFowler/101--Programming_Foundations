# Answers to Hard 1 exercises

def prompt(msg)
  puts "=> #{msg}"
  gets
end

def question(num)
  prompt("Answer to question #{num}:")
end

# method for question 4
def generate_UUID
  characters = ("0".."9").to_a + ("a".."f").to_a
  sections = [8, 4, 4, 4, 12]
  uuid = ""
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += "-" unless index >= (sections.size - 1)
  end
  uuid
end

def question1
  question(1)
  prompt("nil is returned.")
end

def question2
  question(2)
  prompt("It will print the array: { :a => 'hi there' }.  informal_greeting is a reference to the original object, so modifying it also modifies the object.")
end

def question3
  question(3)
  prompt("A) Will print 'one is one', 'two is two', 'three is three'")
  prompt("B) Will print 'one is one', 'two is two', 'three is three'")
  prompt("C) Will print 'one is two', 'two is three', 'three is one'")
end

def question4
  question(4)
  prompt(generate_UUID)
end

def question5
  def is_a_number?(num)
    num.to_i.to_s == num
  end
  def dot_separated_ip_address?(input_string)
    dot_separated_words = input_string.split(".")
    return false if dot_separated_words.size != 4 # return false unless dot_seperated_words.size == 4
    
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false if !is_a_number?(word) # return false unless is_a_number?(word)
    end

    true
  end
  question(5)
  prompt(dot_separated_ip_address?("1.33.24.54"))
end

question1
question2
question3
question4
question5