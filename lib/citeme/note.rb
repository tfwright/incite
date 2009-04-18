module CiteMe
  class Note < CiteMe::Citation
    
    REQUIRED_ATTRS = %w(authors title publisher year pages)
    
    def to_html
      relevant_attributes = %w(authors title translators editors volume edition city publisher year pages)
      relevant_attributes.inject("") do |string, attribute|
        string << format_segment_for(attribute)
      end
    end
    
    private
    
      def format_segment_for(attribute)
        case attribute
        when "authors"
          formatted_contributors(:authors) + ", "
        when "title"
          "<em>#{source.title}</em>"
        when "translators"
          ", trans. #{formatted_contributors(:translators)}" if source.translators.any?
        when "editors"
          ", ed. #{formatted_contributors(:editors)}" if source.editors.any?
        when "volume"
          ", vol. #{source.volume}" if source.volume
        when "edition"
          ", #{source.edition} ed." if source.edition
        when "city"
          segment = " ("
          segment << "#{source.city}: " if source.city
          segment
        when "publisher"
          "#{source.publisher}, "
        when "year"
          "#{source.year}), "
        when "pages"
          "#{formatted_pages}."
        end.to_s
      end
      
      def valid_source?
        source.has_attributes?(REQUIRED_ATTRS)
      end
    
  end
end

