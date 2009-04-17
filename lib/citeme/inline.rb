module CiteMe
  class Inline < CiteMe::Citation
    
    def to_html
      "(#{formatted_authors}. #{source.year}, #{formatted_pages})"
    end
    
  end
end