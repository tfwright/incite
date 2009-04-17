module CiteMe
  class Entry < CiteMe::Citation
    
    def to_html
      "#{formatted_authors}. <em>#{source.title}</em>. #{source.city}: #{source.publisher}, #{source.year}."
    end
    
  end
end