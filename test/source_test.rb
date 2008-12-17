require(File.join(File.dirname(__FILE__), 'test_helper'))

unit_tests do
  
  test "initializes with metadata hash attr" do
    assert_nothing_raised do
      source = CiteMe::Source.new(:metadata => {:title => "Test title"})
      assert_equal({:title => "Test title"}, source.metadata)
    end
  end
  
  test "outputs html for a given type of citation" do
    source = CiteMe::Source.new(:metadata => {:authors => ["Han Solo", "James Kirk"], :publisher => "Random House",
      :city => "New York", :year => 1983, :title => "Memoirs from Space", :pages => [(45..49), 51]})
    assert_equal "James Kirk and Han Solo. <em>Memoirs from Space</em>. New York: Random House, 1983.", source.citation(:Entry)
  end
  
end