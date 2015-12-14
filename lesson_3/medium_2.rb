# Answers to Medium 2 exercises

def prompt(msg)
  puts "=> #{msg}"
  gets
end

def question(num)
  prompt("Answer to question #{num}:")
end

def question1
  question(1)
  munsters = { 
  "Herman" => { "age" => 32, "gender" => "male" }, 
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" }
  }
  total_age = 0
  munsters.each do |key, value|
    if value["gender"] == "male"
      total_age += value["age"]
    end
  end
  prompt(total_age)
end

def question2
  question(2)
  munsters = { 
  "Herman" => { "age" => 32, "gender" => "male" }, 
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
  }
  munsters.each_pair do |key, value|
    prompt("#{key} is a #{value["age"]} old #{value["gender"]}.")
  end
end

def question3
  question(3)
  def tricky_method(a_string_param, an_array_param)
    a_string_param += "rutabaga"
    an_array_param << "rutabaga"
  end

  my_string = "pumpkins"
  my_array = ["pumpkins"]
  tricky_method(my_string, my_array)

  puts "My string looks like this now: #{my_string}"
  puts "My array looks like this now: #{my_array}"
  def not_so_tricky_method(a_string_param, an_array_param)
    a_string_param += "rutabaga"
    an_array_param += ["rutabaga"]

    return a_string_param, an_array_param
  end

  my_string = "pumpkins"
  my_array = ["pumpkins"]
  my_string, my_array = not_so_tricky_method(my_string, my_array)

  prompt("My string looks like this now: #{my_string}")
  prompt("My array looks like this now: #{my_array}")
end

def question4
  question(4)
  sentence = "Humpty Dumpty sat on a wall."
  sentence_backwards = sentence.split(/\W/).reverse!.join(' ') + '.'
  prompt(sentence_backwards)
end

def question5
  question(5)
  answer = 42

  def mess_with_it(some_number)
    some_number += 8
  end

  new_answer = mess_with_it(answer)

  prompt(p answer - 8)
end

def question6
  question(6)
  prompt("Spot has altered the actual hash.")
end

def question7
  question(7)
  prompt("The result is paper")
end

def question8
  question(8)
  prompt("The answer is 'no'.")
end

question1
question2
question3
question4
question5
question6
question7
question8
