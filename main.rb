require_relative './person'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './app'

def options(option, app)
  actions = {
    1 => -> { app.list_all_books },
    2 => -> { app.list_all_people },
    3 => lambda {
      puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      input = gets.chomp.to_i
      input == 1 ? app.create_person('student') : app.create_person('teacher')
    },
    4 => -> { app.create_book },
    5 => -> { app.create_rental },
    6 => -> { app.list_all_rentals },
    7 => -> { puts 'bye!' },
    :default => -> { puts 'Please enter a valid option' }
  }

  actions.fetch(option, actions[:default]).call
end

def main
  app = App.new
  loop do
    puts 'Welcome to School Library App!'
    puts 'Please choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'
    option = gets.chomp.to_i
    options(option, app)
    break if option == 7
  end
end

main
