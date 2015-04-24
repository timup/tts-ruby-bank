class Account
  
  def initialize(name, balance, account_number)
    @name = name
    @balance = balance
    @account_number = account_number
  end
  
  def name
    @name
  end
  
  def account_number
    @account_number
  end
  
  def balance
    @balance
  end
  
  def deposit(amount)
    @balance += amount
  end
  
  def withdrawal(amount)
    @balance -= amount
  end
  
end

def main
  puts "welcome to Tech Talent Bank!"
  
  @account_count = 0
  
  @saved_accounts = []
  
  menu(@account_count, @saved_accounts)
end

def menu(account_count, saved_accounts)
  puts "Please make a selection:"
  puts "-------------------------"
  puts "1. Create New Account"
  puts "2. View Exisiting Account"
  
  choice = gets.chomp.to_i
  
  if choice == 1
    create_account(account_count, saved_accounts)
  elsif choice == 2
    view_existing_account(account_count, saved_accounts)
  else
    puts `clear`
    puts "Invalid Selection!"
    menu(account_count, saved_accounts)
  end
  
end

def create_account(account_count, saved_accounts)
  puts "Create An Account:"
  puts "-------------------"
  print "Enter Name: "
  name = gets.chomp
  print "Initial Deposit: "
  initial_deposit = gets.chomp.to_f
  account_count += 1
  new_account = Account.new(name, initial_deposit, account_count)
  saved_accounts.push(new_account)
  puts "Account created successfully!"
  return_to_menu(account_count, saved_accounts)
end

def view_existing_account(account_count, saved_accounts)
  puts `clear`
  puts "Please enter account number: "
  acct_num = gets.chomp.to_i
  saved_accounts.each do |account|
    if account.account_number == acct_num
      puts account.name
      puts "Balance: $#{account.balance}"
      view_account_menu(account_count, saved_accounts, account)
    end
  end
end

def view_account_menu(account_count, saved_accounts, account)
  puts "Please Make a Selection:"
  puts "-------------------------"
  puts "1. Make a Withdrawal"
  puts "2. Make a Deposit"
  puts "3. Return to Main Menu"
  
  choice = gets.chomp.to_i
  
  if choice == 1
    make_withdrawal(account_count, saved_accounts, account)
  elsif choice == 2
    make_deposit(account_count, saved_accounts, account)
  elsif choice == 3
    puts `clear`
    view_account_menu(account_count, saved_accounts, account)
  end
end

def make_deposit(account_count, saved_accounts, account)
  print "How much would you like to deposit: "
  deposit_amount = gets.chomp.to_f
  
  account.deposit(deposit_amount)
  
  puts "New balance: $#{account.balance}"
  
  account_menu_return(account_count, saved_accounts, account)
end

def make_withdrawal(account_count, saved_accounts, account)
  print "How much would you like to withdraw?"
  withdrawal_amount = gets.chomp.to_f
  
  account.withdrawal(withdrawal_amount)
  
  puts "New balance: $#{account.balance}"
  
  account_menu_return(account_count, saved_accounts, account)
end

def account_menu_return(account_count, saved_accounts, account)
  puts "Return to Existing Account Menu? [y/n]"
  choice = gets.chomp.downcase
  
  if choice == "y"
    view_account_menu(account_count, saved_accounts, account)
  elsif choice == "n"
    puts "Goodbye."
  else
    puts "Not a valid choice."
    account_menu_return(account_count, saved_accounts, account)
  end
end

def return_to_menu(account_count, saved_accounts)
  puts "Return to Main Menu [y/n]"
  choice = gets.chomp.downcase
  
  if choice == "y"
    menu(account_count, saved_accounts)
  elsif choice == "n"
    puts "Goodbye."
  else
    puts "Not a valid choice."
    return_to_menu(account_count, saved_accounts)
  end
end

main