module Incite
  class Reference < Incite::Citation
    
    def to_html
      "#{formatted_contributors(:authors)}. #{source.year}. <em>#{source.title}</em>. #{source.city}: #{source.publisher}."
    end
    
  end
end
