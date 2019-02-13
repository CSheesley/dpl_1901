require './test/test_helper'

class AuthorTest < Minitest::Test

  def setup
    @nk_jemisin = Author.new(
      {first_name: "N.K.",
       last_name: "Jemisin"})

    @book_1 = Book.new(
        {author_first_name: "N.K.",
         author_last_name: "Jemisin",
         title: "The Fifth Season",
         publication_date: "November 3, 2015"})

    @book_2 = Book.new(
        {author_first_name: "N.K.",
        author_last_name: "Jemisin",
        title: "The Hundred Thousand Kingdoms",
        publication_date: "2010"})

  end

  def test_it_exists

    assert_instance_of Author, @nk_jemisin
  end

  def test_it_starts_with_no_books

    assert_equal [], @nk_jemisin.books
  end

  def test_it_can_add_books
    #Test not passing, but pry shows desired result?
    #No visible difference in the Array#inspect output.
    #You should look at the implementation of #== on Array or its members.

    @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")

    assert_equal [@book_1], @nk_jemisin.books

    @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    assert_equal [@book_1, @book_2], @nk_jemisin.books
  end

end
