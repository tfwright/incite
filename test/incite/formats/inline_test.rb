require "test_helper"

unit_tests do
  
  test "displays html for an in-text citation" do
    source = Incite::Source.new(:authors => ["Han Solo", "James Kirk"], :publisher => "Random House",
      :city => "New York", :year => 1983, :title => "Memoirs from Space", :pages => [(45..49), 51])
    inline = Incite::Inline.new(source)
    assert_equal "(James Kirk and Han Solo. 1983, 45-49, 51)", inline.to_html
  end
  
end
