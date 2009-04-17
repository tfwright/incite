require(File.join(File.dirname(__FILE__), 'test_helper'))

unit_tests do
  
  test "displays html for a reference" do
    source = CiteMe::Source.new(:authors => ["Han Solo", "James Kirk"], :publisher => "Random House",
      :city => "New York", :year => 1983, :title => "Memoirs from Space", :pages => [(45..49), 51])
    reference = CiteMe::Reference.new(source)
    assert_equal "James Kirk and Han Solo. 1983. <em>Memoirs from Space</em>. New York: Random House.", reference.to_html
  end
  
end