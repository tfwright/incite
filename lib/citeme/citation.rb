module CiteMe
  class Citation
    attr_accessor :title, :authors, :publisher, :city, :year, :pages
    
    def initialize(attrs)
      attrs.each do |attr, value|
        self.send("#{attr}=", value)
      end
    end
    
    private
    
      def formatted_pages
        pages.map { |p| p.is_a?(Range) ? "#{p.first}-#{p.last}" : p }.join(", ")
      end
    
      def formatted_authors
        ordered_authors = authors.sort_by { |a| a.split(" ").last }
        case ordered_authors.size
        when 2
          ordered_authors.join(" and ")
        when 3..5
          ordered_authors.first + " et al."
        else
          ordered_authors.first
        end
      end 
        
  end

end
