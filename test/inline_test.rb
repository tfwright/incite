require(File.join(File.dirname(__FILE__), 'test_helper'))

unit_tests do
  
  test "displays html for an in-text citation" do
    inline = CiteMe::Inline.new(:authors => ["Han Solo", "James Kirk"], :publisher => "Random House",
      :city => "New York", :year => 1983, :title => "Memoirs from Space", :pages => [(45..49), 51])
    assert_equal "(James Kirk and Han Solo. 1983, 45-49, 51)", inline.to_html
  end
  
  test "replaces all ranges in pages attr array with formatted string" do
    inline = CiteMe::Inline.new(:pages => [(45..49), 51])
    CiteMe::Inline.publicize_methods do 
      assert_equal ["45-49", 51], inline.format_ranges
    end
  end
  
end