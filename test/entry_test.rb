require(File.join(File.dirname(__FILE__), 'test_helper'))

unit_tests do
  
  test "displays html for a works cited entry" do
    source = CiteMe::Source.new(:authors => ["Han Solo", "James Kirk"], :publisher => "Random House",
      :city => "New York", :year => 1983, :title => "Memoirs from Space", :pages => [(45..49), 51])
    entry = CiteMe::Entry.new(source)
    assert_equal "James Kirk and Han Solo. <em>Memoirs from Space</em>. New York: Random House, 1983.", entry.to_html
  end
  
end