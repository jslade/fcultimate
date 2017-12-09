module ControllerMacros
  extend ActiveSupport::Concern

  included do
    let(:json) { JSON.parse(response.body) }
  end
end
