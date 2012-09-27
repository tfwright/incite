module Incite
  class Source
    REQUIRED_ATTRS = %w(authors title publisher year pages)
    
    attr_accessor :title, :authors, :publisher, :city, :year, 
      :pages, :editors, :edition, :volume, :translators
    
    def initialize(attrs={})
      attrs.each do |attr, value|
        self.send("#{attr}=", value)
      end
      self.pages ||= []
      self.authors ||= []
      self.editors ||= []
      self.translators ||= []
    end
    
    def citation(type)
      validate_required_attributes!
      citation = Incite.const_get(type.to_s.capitalize).new(self).to_html
    end
    
    def has_attributes?(attrs)
      !attrs.map do |attr|
        value = send(attr)
        (value.is_a?(Array) && value.any?) || (!value.is_a?(Array) && !value.nil?)
      end.include?(false)
    end

    def valid?
      has_attributes?(REQUIRED_ATTRS)
    end
    
    def validate_required_attributes!
      raise ArgumentError, "Source lacks attributes required to construct citation" unless valid?
    end
  end
end
