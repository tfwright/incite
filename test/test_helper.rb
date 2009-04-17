$: << File.join(File.dirname(__FILE__), '..', 'lib')
$: << File.join(File.dirname(__FILE__), '..', 'vendor', 'dust-0.1.6', 'lib')
$: << File.join(File.dirname(__FILE__))

require 'citeme'
require 'rubygems'
require 'test/unit'
require 'dust'

# For testing private methods
# Usage: Klass.publicize_methods { Klass.new.private_method_name }
# http://blog.jayfields.com/2007/11/ruby-testing-private-methods.html
class Class
  def publicize_methods
    saved_private_instance_methods = self.private_instance_methods
    self.class_eval { public(*saved_private_instance_methods) }
    yield
    self.class_eval { private(*saved_private_instance_methods) }
  end
end
