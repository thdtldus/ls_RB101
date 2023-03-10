require 'yaml'

MESSAGES = YAML.load_file("loancalculator.yaml")

PERCENT_DIVISOR = 100
MONTHS_IN_YEAR = 12

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

def valid_integer?(num)
  num.to_s == num.to_i.to_s && num.to_i >= 0
end

def valid_float?(num)
  num.to_s == num.to_f.to_s && num.to_f >= 0.0
end

def valid_loan?(num)
  valid_number?(num) && num.to_f != 0
end

def valid_percentage?(num)
  num >= 0.0 && num <= 100
end

def get_loan_amount
  amount = ''

  loop do
    prompt(MESSAGES["enter_amount"])

    amount = gets.chomp

    if valid_loan?(amount) == false
      prompt(MESSAGES["invalid_amount"])
    else
      break
    end
  end
  format('%.2f', amount.to_f)
end

def get_apr
  rate = ''

  loop do
    prompt(MESSAGES["enter_apr"])

    rate = gets.chomp

    if valid_number?(rate) == false
      prompt(MESSAGES["invalid_apr"])
    else
      break
    end
  end
  rate.to_f
end

def get_loan_duration
  years = ''

  loop do
    prompt(MESSAGES["enter_loan_duration"])

    years = gets.chomp

    if valid_number?(years) == false
      prompt(MESSAGES["invalid_loan_duration"])
    else
      break
    end
  end
  years
end

def calculate_monthly_payment(loan_amount, apr, duration_years)
  amount = loan_amount.to_f
  apr_month = apr.to_f / MONTHS_IN_YEAR
  monthly_rate = apr_month / PERCENT_DIVISOR
  duration_months = duration_years.to_f * MONTHS_IN_YEAR

  num = amount * (monthly_rate / (1 - (1 + monthly_rate)**(-duration_months)))

  format('%.2f', num)
end

# MAIN LOOP

loop do
  system('clear')

  prompt(MESSAGES["welcome"])

  loan_amount = get_loan_amount
  apr = get_apr
  loan_duration = get_loan_duration

  monthly_rate = calculate_monthly_payment(loan_amount, apr, loan_duration)

  prompt "Your monthly payment is $#{monthly_rate} per month"
  prompt "Your total loan amount is $#{loan_amount}."
  prompt "Your annual percentage rate (APR) is #{apr}%."
  prompt "Your loan duration is #{loan_duration} years."

  prompt(MESSAGES["repeat"])
  repeat = gets.chomp.downcase

  break unless repeat == "y"
end

prompt(MESSAGES["goodbye"])
