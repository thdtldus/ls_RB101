require 'yaml'

MESSAGES = YAML.load_file("calculator.yaml")

def prompt(message)
  puts "=>#{message}"
end

def valid_name?(name)
end

def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

def valid_integer?(num)
  num.to_s == num.to_i.to_s
end

def valid_float?(num)
  num.to_s == num.to_f.to_s
end

def valid_operator?(op)

end

def load_operator(op)
  case op
  when '1' then "Adding"
  when '2' then "Subtracting"
  when '3' then "Multiplying"
  when '4' then "Dividing"
  end
end

def get_name
  name = ''

  loop do
    prompt("What is your name?")
    name = gets.chomp

    if valid_name?(name) == false
      prompt("Make sure you enter a name, whitespaces aren't allowed!")
    else
      break
    end
  end
  prompt("Hello, #{name}!")
end

def get_number
  num1 = ''
  num2 = ''

  loop do
    prompt("What is your first number?")
    num1 = gets.chomp.to_i

    if valid_number?(num1) == false
      prompt("You've entered an invalid number. Please try again.")
    else
      break
    end
  end

  loop do
    prompt("What is your second number?")
    num2 = gets.chomp.to_i

    if valid_number?(num2) == false
      prompt("You've entered an invalid number. Please try again.")
    else
      break
    end
  end

end

def get_operator
  @operator = ''

  loop do
    @operator = gets.chomp

  end
end

def calculate()
end

# MAIN LOOP

prompt("Welcome to Calculator!")
