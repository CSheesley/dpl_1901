require './lib/book'

class Author
  attr_reader :first_name, :last_name, :books

  def initialize(author_info)
    @first_name = author_info[:first_name]
    @last_name = author_info[:last_name]
    @books = []
  end

  def add_book(book_name, publication_date)
    book = Book.new({author_first_name: @first_name, author_last_name: @last_name,
    title: book_name, publication_date: publication_date})
    @books << book
    book #why was this return value so important?!
  end

end
