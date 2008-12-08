module CiteMe
  class Inline < CiteMe::Citation
    
    def to_html
      "(#{formatted_authors}. #{year}, #{pages.join("-")})"
    end
    
  end
end