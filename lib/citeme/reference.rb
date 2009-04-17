module CiteMe
  class Reference < CiteMe::Citation
    
    def to_html
      "#{formatted_authors}. #{source.year}. <em>#{source.title}</em>. #{source.city}: #{source.publisher}."
    end
    
  end
end