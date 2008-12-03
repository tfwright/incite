module CiteMe
  class Inline < Bibliographer::Citation
    
    def to_html
      "(#{formatted_authors}. #{year}, #{pages.join("-")})"
    end
    
  end
end