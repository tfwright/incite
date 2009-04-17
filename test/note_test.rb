require(File.join(File.dirname(__FILE__), 'test_helper'))

unit_tests do

  test "displays html for a footnote or endnote" do
    source = CiteMe::Source.new(:authors => ["Han Solo", "James Kirk"], :publisher => "Random House",
      :city => "New York", :year => 1983, :title => "Memoirs from Space", :pages => [(45..49), 51])
    note = CiteMe::Note.new(source)
    assert_equal "James Kirk and Han Solo, <em>Memoirs from Space</em> (New York: Random House, 1983), 45-49, 51.", note.to_html
  end
  
end