module CiteMe
  class Source
    attr_accessor :title, :authors, :publisher, :city, :year, :pages
    
    def initialize(attrs={})
      attrs.each do |attr, value|
        self.send("#{attr}=", value)
      end
      self.pages ||= []
      self.authors ||= []
    end
    
    def citation(type)
      citation = CiteMe.const_get(type.to_s.capitalize).new(self).to_html
    end
    
  end
end