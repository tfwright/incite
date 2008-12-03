module CiteMe
  class Note < Bibliographer::Citation
    
    def to_html
      "#{formatted_authors}, <em>#{title}</em> (#{city}: #{publisher}, #{year}), #{pages.join("-")}."
    end
         
  end
end