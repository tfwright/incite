module Incite
  class Citation
    attr_accessor :source
    
    def initialize(source)
      self.source = source
      validate_required_attributes!
    end
    
    private
    
      def formatted_pages
        source.pages.map { |p| p.is_a?(Range) ? "#{p.first}-#{p.last}" : p }.join(", ")
      end
    
      def formatted_contributors(type)
        ordered_contributors = source.send(type).sort_by { |c| c.split(" ").last }
        case ordered_contributors.size
        when 2
          ordered_contributors.join(" and ")
        when 3..5
          ordered_contributors.first + " et al."
        else
          ordered_contributors.first
        end.to_s
      end
      
      def validate_required_attributes!
        raise ArgumentError, "Source lacks attributes required to construct citation" unless valid_source?
      end
      
      def valid_source?
        true
      end
        
  end

end