require 'bundler'
Bundler.setup

require 'rspec'
require 'arbre'
require 'active_support'

module ArbreIntegrationSpecHelper
  extend self
  # Sets up an Arbre::Builder context
  def setup_arbre_context!
    include Arbre::Builder
    let(:assigns){ {} }
    let(:helpers){ mock_action_view }
    before do
      @_helpers = helpers
    end
  end

  # Returns a fake action view instance to use with our renderers
  def mock_action_view(assigns = {})
    controller = ActionView::TestCase::TestController.new
    ActionView::Base.send :include, ActionView::Helpers
    ActionView::Base.new(ActionController::Base.view_paths, assigns, controller)
  end
  alias_method :action_view, :mock_action_view
end

include ArbreIntegrationSpecHelper
