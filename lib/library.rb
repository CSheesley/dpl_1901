class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def all_titles
    @books.map do |book|
      book.title
    end
  end

  def include?(title)
    if all_titles.include?(title)
      true
    else
      false
    end
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end

  def all_by_author(author)
    @books.find_all do |book|
      book.author_last_name == author.split.last
    end
  end

  def find_by_author(author)
    by_title = all_by_author(author).group_by do |book|
      book.title
    end
  end

  def all_by_date(date)
    @books.find_all do |book|
      book.publication_date == #last 4 characters of publication date string
    end
  end

  def find_by_publication_date

  end

end
