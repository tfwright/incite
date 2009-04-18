module CiteMe
  class Note < CiteMe::Citation
    
    def to_html
      "#{formatted_contributors(:authors)}, <em>#{source.title}</em>, trans. #{formatted_contributors(:translators)}, ed. #{formatted_contributors(:editors)}, vol. #{source.volume}, #{source.edition} ed. (#{source.city}: #{source.publisher}, #{source.year}), #{formatted_pages}."
    end
         
  end
end

