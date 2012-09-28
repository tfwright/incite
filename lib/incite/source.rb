module Incite
  class Source
    
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
      citation = Incite.const_get(type.to_s.capitalize).new(self)
    end
    
    def has_attributes?(attrs)
      !attrs.map do |attr|
        value = send(attr)
        (value.is_a?(Array) && value.any?) || (!value.is_a?(Array) && !value.nil?)
      end.include?(false)
    end

  end
end
