module CiteMe
  class Note < CiteMe::Citation
    
    def to_html
      "#{formatted_authors}, <em>#{title}</em> (#{city}: #{publisher}, #{year}), #{format_ranges.join("-")}."
    end
         
  end
end