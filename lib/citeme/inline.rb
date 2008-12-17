module CiteMe
  class Inline < CiteMe::Citation
    
    def to_html
      "(#{formatted_authors}. #{year}, #{format_ranges.join(", ")})"
    end
    
  end
end