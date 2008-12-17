module CiteMe
  class Inline < CiteMe::Citation
    
    def to_html
      "(#{formatted_authors}. #{year}, #{format_ranges.join(", ")})"
    end
    
    private
    
      def format_ranges
        pages.map { |p| p.is_a?(Range) ? "#{p.first}-#{p.last}" : p }
      end
    
  end
end