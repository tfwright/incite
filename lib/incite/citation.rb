module Incite
  class Citation
    REQUIRED_SOURCE_ATTRS = %w(authors title publisher year)

    attr_accessor :source
    
    def initialize(source)
      self.source = source
    end

    protected

    def validate_source!
      raise ArgumentError, "Source lacks attributes required to construct citation" unless source.has_attributes?(REQUIRED_SOURCE_ATTRS)
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

  end
end
