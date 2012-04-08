require "arbre/builder"
require "arbre/context"
require "arbre/html/element"
require "arbre/html/attributes"
require "arbre/html/collection"
require "arbre/html/class_list"
require "arbre/html/tag"
require "arbre/html/document"
require "arbre/html/html5_elements"
require "arbre/html/text_node"

# Arbre - The DOM Tree in Ruby
#
# Arbre is a ruby library for building HTML in pure Object Oriented Ruby
module Arbre
end

require 'action_view'

ActionView::Template.register_template_handler :arb, lambda { |template|
  "self.class.send :include, Arbre::Builder; @_helpers = self; @__current_dom_element__ = Arbre::Context.new(assigns, self); begin; #{template.source}; end; current_dom_context"
}

