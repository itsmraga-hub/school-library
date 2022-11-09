require './teacher'
require './student'
require './book'
require './rental'
require './classroom'
require './person'
require './file_operations'
require 'json'
require 'pry'

class App
  attr_accessor :books, :students, :teachers, :rentals

  def initialize
    @books = []
    @peoples = []
    @rentals = []
    @persist_people = Persist.new('store/persons.json')
    @persist_books = Persist.new('store/books.json')
    @persist_rentals = Persist.new('store/rentals.json')
  end

  def list_books
    books_list = @persist_books.load
    books_list.each_with_index do |bk, i|
      puts "Book#{i + 1}] Title: #{bk['title']}\n   Author: #{bk['author']}\n   Book ID: #{i}"
    end
  end

  def list_peoples
    peoples_list = @persist_people.load
    peoples_list.each_with_index do |p, i|
      puts "#{i + 1}] [#{p['class']}] Name: #{p['name']}\n\t     Person ID: #{p['id']}"
    end
  end

  def create_student
    puts 'Great!! lets create a student!'
    print 'Student Name: '
    name = gets.chomp
    print 'Student Age: '
    age = gets.chomp.to_i
    print 'Student Classroom: '
    cl = gets.chomp
    print 'Do you have parent permission? (true(T) or False(F): '
    permission = gets.chomp.strip.upcase
    case permission
    when 'T'
      @peoples.push(Student.new(age, name, true, cl))
      puts 'Student created successfully!'
    when 'F'
      @peoples.push(Student.new(age, name, false, cl))
      puts 'Student created successfully!'
    else
      puts 'Invalid'
    end
  end

  def create_teacher
    puts 'Great! Lets create a teacher.'
    print 'Teacher name: '
    name = gets.chomp
    print 'Teacher Age: '
    age = gets.chomp
    print 'Teacher\'s specialization: '
    specialization = gets.chomp
    @peoples.push(Teacher.new(age, name, specialization))
    puts 'Teacher created successfully!'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i
    case choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'INVALID NUMBER!!'
    end
    persons_list = @persist_people.load
    @peoples.each do |person|
      persons_list << {
        name: person.name, id: person.id, age: person.age, class: person.class
      }
    end
    @persist_people.save(persons_list)
  end

  def create_book
    print 'Book Title: '
    title = gets.chomp
    print 'Book Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully!'
    books_list = @persist_books.load
    @books.each do |book|
      books_list << {
        title: book.title, author: book.author
      }
    end
    @persist_books.save(books_list)
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    list_books
    puts 'Book\'s ID: '
    bk_choice = gets.chomp.to_i
    puts 'Select a person from the following list by ID:'
    list_peoples
    puts 'Person\s ID: '
    p_choice = gets.chomp.to_i
    print 'Enter today\'s date: '
    date = gets.chomp
    book_lender = @persist_people.load.select { |p| p['id'] == p_choice }
    @rentals.push(Rental.new(date, @persist_books.load[bk_choice], book_lender[0]))
    rentals_list = @persist_rentals.load
    @rentals.each do |rental|
      rentals_list << { date: rental.date, book: { title: rental.book['title'], author: rental.book['author'] },
                        person: { id: rental.person['id'], name: rental.person['name'], age: rental.person['age'],
                                  class: rental.person['class'] } }
    end
    @persist_rentals.save(rentals_list)
    puts 'Rental added successfully'
  end

  def list_rentals
    rentals_list = @persist_rentals.load
    list_peoples
    print 'Id of person: '
    id = gets.chomp.to_i

    person = list_peoples.select { |p| p['id'] == id }

    if !person[0].empty?
      puts "#{person[0]['name']}'s rented books: \n"
      rentals_list.each_with_index do |rental, _i| \
        if rental['person']['id'] == id
          puts "Date: #{rental['date']}, Book: #{rental['book']['title']} by #{rental['book']['author']}"
        end
      end
    end
  end
end
