require(File.join(File.dirname(__FILE__), 'test_helper'))

unit_tests do

  def to_html
    "#{formatted_authors}, <em>#{title}</em> (#{city}: #{publisher}, #{year}), #{pages.join("-")}."
  end
    
  test "displays html for a footnote or endnote" do
    note = CiteMe::Note.new(:authors => ["Han Solo", "James Kirk"], :publisher => "Random House",
      :city => "New York", :year => 1983, :title => "Memoirs from Space", :pages => [(45..49), 51])
    assert_equal "James Kirk and Han Solo, <em>Memoirs from Space</em> (New York: Random House, 1983), 45-49, 51.", note.to_html
  end
  
end