module CiteMe
  class Reference < Bibliographer::Citation
    
    def to_html
      "#{formatted_authors}. #{year}. <em>#{title}</em>. #{city}: #{publisher}."
    end
  end
end