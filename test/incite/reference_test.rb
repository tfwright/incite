require "test_helper"

unit_tests do
  
  test "displays html for a reference" do
    source = Incite::Source.new(:authors => ["Han Solo", "James Kirk"], :publisher => "Random House",
      :city => "New York", :year => 1983, :title => "Memoirs from Space", :pages => [(45..49), 51])
    reference = Incite::Reference.new(source)
    assert_equal "James Kirk and Han Solo. 1983. <em>Memoirs from Space</em>. New York: Random House, 1983.", reference.to_html
  end
  
end
