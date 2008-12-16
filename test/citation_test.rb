require(File.join(File.dirname(__FILE__), 'test_helper'))

unit_tests do
  
  test "initializes with attr hash" do
    assert_nothing_raised do
      citation = CiteMe::Citation.new(:authors => ["Test Author"])
      assert_equal ["Test Author"], citation.authors
    end
  end
  
  test "formats two authors sorting alphabetically joined with 'and'" do
    citation = CiteMe::Citation.new(:authors => ["Han Solo", "James Kirk"])
    CiteMe::Citation.publicize_methods do 
      assert_equal "James Kirk and Han Solo", citation.formatted_authors
    end
  end
  
  test "formats three authors with first and 'et al'" do
    citation = CiteMe::Citation.new(:authors => ["Han Solo", "James Kirk", "Cat Stevens"])
    CiteMe::Citation.publicize_methods do 
      assert_equal "James Kirk et al.", citation.formatted_authors
    end
  end
  
  test "formats one author simply" do
    citation = CiteMe::Citation.new(:authors => ["Han Solo"])
    CiteMe::Citation.publicize_methods do 
    assert_equal "Han Solo", citation.formatted_authors
    end
  end
  
end