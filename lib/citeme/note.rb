module CiteMe
  class Note < CiteMe::Citation
    
    def to_html
      "#{formatted_authors}, <em>#{source.title}</em> (#{source.city}: #{source.publisher}, #{source.year}), #{formatted_pages}."
    end
         
  end
end