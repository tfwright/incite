require(File.join(File.dirname(__FILE__), 'test_helper'))

unit_tests do
  
  test "initializes with source" do
    source = CiteMe::Source.new
    citation = CiteMe::Citation.new(source)
    assert_not_nil citation.source
  end
  
  test "formats two authors sorting alphabetically joined with 'and'" do
    source = CiteMe::Source.new(:authors => ["Han Solo", "James Kirk"])
    citation = CiteMe::Citation.new(source)
    CiteMe::Citation.publicize_methods do 
      assert_equal "James Kirk and Han Solo", citation.formatted_authors
    end
  end
  
  test "formats three authors with first and 'et al'" do
    source = CiteMe::Source.new(:authors => ["Han Solo", "James Kirk", "Cat Stevens"])
    citation = CiteMe::Citation.new(source)
    CiteMe::Citation.publicize_methods do 
      assert_equal "James Kirk et al.", citation.formatted_authors
    end
  end
  
  test "formats one author simply" do
    source = CiteMe::Source.new(:authors => ["Han Solo"])
    citation = CiteMe::Citation.new(source)
    CiteMe::Citation.publicize_methods do 
    assert_equal "Han Solo", citation.formatted_authors
    end
  end
  
  test "formats array of pages for display in html" do
    source = CiteMe::Source.new(:pages => [(45..49), 51])
    citation = CiteMe::Citation.new(source)
    CiteMe::Citation.publicize_methods do 
      assert_equal "45-49, 51", citation.formatted_pages
    end
  end
  
end