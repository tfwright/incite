module CiteMe
  class Entry < Bibliographer::Citation
    
    def to_html
      "#{formatted_authors}. <em>#{title}</em>. #{city}: #{publisher}, #{year}."
    end
    
  end
end