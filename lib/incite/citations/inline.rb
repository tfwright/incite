module Incite
  class Inline < Incite::Citation
    
    def to_html
      "(#{formatted_contributors(:authors)}. #{source.year}, #{formatted_pages})"
    end
    
  end
end
