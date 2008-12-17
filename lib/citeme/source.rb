module CiteMe
  class Source
    attr_accessor :metadata
    
    def initialize(attrs)
      attrs.each do |attr, value|
        self.send("#{attr}=", value)
      end
    end
    
    def citation(type)
      citation = CiteMe.const_get(type.to_s).new(metadata).to_html
    end
    
  end
end