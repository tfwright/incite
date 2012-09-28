require "test_helper"

unit_tests do
  
  test "initializes with source" do
    source = Incite::Source.new(title: "Test", authors: ["Han Solo"], year: "1999", publisher: "Shoehorn Press")
    citation = Incite::Citation.new(source)
    assert_not_nil citation.source
  end
  
  test "formats two authors sorting alphabetically joined with 'and'" do
    source = Incite::Source.new(title: "Test", authors: ["Han Solo", "James Kirk"], year: "1999", publisher: "Shoehorn Press")
    citation = Incite::Citation.new(source)
    Incite::Citation.publicize_methods do 
      assert_equal "James Kirk and Han Solo", citation.formatted_contributors(:authors)
    end
  end
  
  test "formats three authors with first and 'et al'" do
    source = Incite::Source.new(title: "Test", authors: ["Han Solo", "James Kirk", "Cat Stevens"], year: "1999", publisher: "Shoehorn Press")
    citation = Incite::Citation.new(source)
    Incite::Citation.publicize_methods do 
      assert_equal "James Kirk et al.", citation.formatted_contributors(:authors)
    end
  end
  
  test "formats one author simply" do
    source = Incite::Source.new(title: "Test", authors: ["Han Solo"], year: "1999", publisher: "Shoehorn Press")
    citation = Incite::Citation.new(source)
    Incite::Citation.publicize_methods do 
    assert_equal "Han Solo", citation.formatted_contributors(:authors)
    end
  end
  
  test "formats array of pages for display in html" do
    source = Incite::Source.new(title: "Test", authors: ["Han Solo", "James Kirk", "Cat Stevens"], year: "1999", publisher: "Shoehorn Press", pages: [(45..49), 51])
    citation = Incite::Citation.new(source)
    Incite::Citation.publicize_methods do 
      assert_equal "45-49, 51", citation.formatted_pages
    end
  end
  
  test "returns an empty string when there are no contributors" do
    source = Incite::Source.new(title: "Test", authors: ["Han Solo"], year: "1999", publisher: "Shoehorn Press", translators: [])
    citation = Incite::Citation.new(source)
    Incite::Citation.publicize_methods do 
      assert_equal "", citation.formatted_contributors(:translators)
    end
  end

    test "raises error if source lacks required attributes" do
    assert_raises ArgumentError do
      Incite::Citation.new(Incite::Source.new)
    end
  end

end
