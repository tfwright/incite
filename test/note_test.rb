require(File.join(File.dirname(__FILE__), 'test_helper'))

unit_tests do

  test "displays html for a footnote or endnote" do
    source = CiteMe::Source.new(:authors => ["Han Solo", "James Kirk"], :publisher => "Random House",
      :city => "New York", :year => 1983, :title => "Memoirs from Space", :pages => [(45..49), 51],
      :translators => ["Kooky Kookaboora"], :editors => ["Lil Rascal"], :volume => 1, :edition => 2)
    note = CiteMe::Note.new(source)
    assert_equal "James Kirk and Han Solo, <em>Memoirs from Space</em>, trans. Kooky Kookaboora, ed. Lil Rascal, vol. 1, 2 ed. (New York: Random House, 1983), 45-49, 51.", note.to_html
  end
  
  test "omits optional fields without including related formatting and punctuation" do
    source = CiteMe::Source.new(:authors => ["Han Solo", "James Kirk"], :publisher => "Random House",
      :year => 1983, :title => "Memoirs from Space", :pages => [(45..49), 51])
    note = CiteMe::Note.new(source)
    assert_equal "James Kirk and Han Solo, <em>Memoirs from Space</em> (Random House, 1983), 45-49, 51.", note.to_html
  end
  
  test "raises error if source lacks required attributes" do
    source = CiteMe::Source.new
    assert_raises ArgumentError do
      CiteMe::Note.new(source)
    end
  end
  
end