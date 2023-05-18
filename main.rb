require_relative './person'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './app'

def Options(option, app)
  case option
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    puts "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    gets.chomp.to_i == 1 ? app.create_person('student') : app.create_person('teacher')
  when 4

    app.create_book
  when 5
    app.create_rental

  when 6
    app.list_all_rentals
  when 7
    puts "Bye!"
  else
    puts "Please enter a valid option"
  end
end

def Main
  app = App.new
  loop do
    puts "Welcome to School Library App!"
    puts "Please choose an option by entering a number:"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List all rentals for a given person id"
    puts "7. Exit"
    option = gets.chomp.to_i
    Options(option, app)
    break if option == 7
  end
end

Main()
