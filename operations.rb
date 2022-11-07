require_relative './app'

class Operations
  def initialize
    @app = App.new
  end

  def list_options
    puts '
    Please choose one of the options: (1 - 7)
      1. - List all books
      2. - List all people
      3. - Create a person
      4. - Create a book
      5. - Create a rental
      6. - List all rentals for a given person id
      7. Exit
    '
  end

  def start_program
    loop do
      list_options
      choice = gets.chomp.to_i
      if choice.between?(1, 7)
        if choice == 7
          puts 'Thank you for using this app!'
          exit
        else
          choose_operation(choice)
        end
      end
    end
  end

  def choose_operation(opt)
    case opt
    when 1
      # binding.pry
      @app.list_books
    when 2
      @app.list_peoples
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals
    end
  end
end