module Incite
  class Entry < Incite::Citation
    
    def to_html
      validate_source!
      "#{formatted_contributors(:authors)}. <em>#{source.title}</em>. #{source.city}: #{source.publisher}, #{source.year}."
    end
    
  end
end
