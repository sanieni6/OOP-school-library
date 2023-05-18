require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts 'Database empty' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    puts 'Database empty' if @people.empty?
    @people.each do |person|
      puts "Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person(type)
    if type == 'student'
      create_student
    elsif type == 'teacher'
      create_teacher
    else
      puts 'Invalid person type'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'HAS PARENT PERMISSION? [Y/N]: '
    parent_permission = gets.chomp == 'y'
    student = Student.new(age, name, parent_permission: parent_permission)
    @people.push(student)
    puts 'Student created sucessfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Teacher created sucessfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts 'Book created sucessfully'
    @books.push(book)
    # print(@books)
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}. Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}. Name: #{person.name}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals.push(rental)

    puts 'Rental created sucessfully'
  end

  def list_all_rentals
    if @rentals.empty?
      puts 'Database empty'
    else
      puts 'Enter the id of the person:'
      @people.each do |person|
        puts "ID: #{person.id}. Name: #{person.name}, Age: #{person.age}"
      end
      id = gets.chomp.to_i
      rentals_found = false

      puts 'Rentals:'
      @rentals.each do |rental|
        if rental.person.id == id
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
          rentals_found = true
        end
      end

      puts 'No rentals for this person' unless rentals_found
    end
  end
end
