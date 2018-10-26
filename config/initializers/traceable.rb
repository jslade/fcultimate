Traceable.configure do |config|
  config.logger = Rails.logger
  config.max_array_values = 30
  config.max_hash_keys = 30
end

class ActiveRecord::Base
  def to_trace
    pkey = self.class.primary_key
    "<#{self.class.name}:#{pkey}:#{read_attribute(pkey)}>"
  end
end
