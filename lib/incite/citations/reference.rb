module Incite
  class Reference < Incite::Citation
    
    def to_html
      "#{formatted_contributors(:authors)}. <em>#{source.title}</em>. #{source.city}: #{source.publisher}, #{source.year}."
    end
    
  end
end
