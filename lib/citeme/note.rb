module CiteMe
  class Note < CiteMe::Citation
    
    def to_html
      "#{formatted_authors}, <em>#{title}</em> (#{city}: #{publisher}, #{year}), #{formatted_pages}."
    end
         
  end
end