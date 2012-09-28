require "test_helper"

unit_tests do

  test "initializes with metadata hash attr" do
    source = Incite::Source.new(:title => "Test title")
    assert_equal("Test title", source.title)
  end

  test "can be initialized without attrs" do
    assert_nothing_raised do
      source = Incite::Source.new
    end
  end

  test "citation of given type" do
    source = Incite::Source.new(:authors => ["Han Solo", "James Kirk"], :publisher => "Random House",
      :city => "New York", :year => 1983, :title => "Memoirs from Space", :pages => [(45..49), 51])
    assert_kind_of Incite::Entry, source.citation(:entry)
  end

  test "returns true if every element in array is an array with at least one element or not nil" do
    source = Incite::Source.new(:authors => ["Test Author"], :title => "Test Title")
    Incite::Source.publicize_methods do 
      assert source.has_attributes?([:authors, :title])
    end
  end

  test "returns false if every element in array is an array with at least one element or not nil" do
    source = Incite::Source.new(:authors => [], :title => "Test Title")
    Incite::Source.publicize_methods do 
      assert !source.has_attributes?([:authors, :title])
    end
  end

end
