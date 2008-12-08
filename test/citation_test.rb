require(File.join(File.dirname(__FILE__), 'test_helper'))

unit_tests do
  test "formats two authors sorting alphabetically joined with 'and'" do
    citation = CiteMe::Citation.new(:authors => ["Han Solo", "James Kirk"])
    CiteMe::Citation.publicize_methods do 
      assert_equal "James Kirk and Han Solo", citation.formatted_authors
    end
  end
end