require(File.join(File.dirname(__FILE__), 'test_helper'))

unit_tests do
  
  test "initializes with metadata hash attr" do
    source = CiteMe::Source.new(:title => "Test title")
    assert_equal("Test title", source.title)
  end
  
  test "can be initialized without attrs" do
    assert_nothing_raised do
      source = CiteMe::Source.new
    end
  end
  
  test "outputs html for a given type of citation" do
    source = CiteMe::Source.new(:authors => ["Han Solo", "James Kirk"], :publisher => "Random House",
      :city => "New York", :year => 1983, :title => "Memoirs from Space", :pages => [(45..49), 51])
    assert_equal "James Kirk and Han Solo. <em>Memoirs from Space</em>. New York: Random House, 1983.", source.citation(:Entry)
  end
  
  test "correctly interprets lowercase citation types" do
    source = CiteMe::Source.new
    assert_nothing_raised do
      source.citation(:note)
    end
  end
  
end