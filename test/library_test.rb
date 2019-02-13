require './test/test_helper'

class LibraryTest < Minitest::Test

  def setup
    @dpl = Library.new

    @nk_jemisin = Author.new(
      {first_name: "N.K.",
      last_name: "Jemisin"})

    @fifth_season = @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    @kingdoms = @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    @harper_lee = Author.new(
      {first_name: "Harper",
       last_name: "Lee"})

    @mockingbird = @harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
  end

  def test_it_exists

    assert_instance_of Library, @dpl
  end

  def test_it_begins_with_no_books

    assert_equal [], @dpl.books
  end

  def test_it_can_add_books_to_its_colelction
    @dpl.add_to_collection(@fifth_season)

    assert_equal [@fifth_season], @dpl.books

    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)

    assert_equal [@fifth_season, @mockingbird, @kingdoms], @dpl.books
  end

  def test_it_can_check_if_a_book_is_in_its_collectio
    @dpl.add_to_collection(@fifth_season)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)

    assert_equal true, @dpl.include?("To Kill a Mockingbird")
    assert_equal false, @dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_books_can_be_listed_in_alphabetical_order_by_authors_last_name
    @dpl.add_to_collection(@fifth_season)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)

    assert_equal [@fifth_season, @kingdoms, @mockingbird], @dpl.card_catalogue
  end

  def test_it_can_find_books_by_author_or_publication_date
    @dpl.add_to_collection(@fifth_season)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)

    expected = (
      {"The Fifth Season" => @fifth_season,
        "The Hundred Thousand Kingdoms" => @kingdoms}
      )

    #close but returns hash values as an array?
    assert_equal expected, @dpl.find_by_author("N.K. Jemisin")
    # assert_equal ({"To Kill a Mockingbird" => @mockingbird}), @dpl.find_by_publication_date("1960")
  end

end
