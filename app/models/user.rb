class User < ApplicationRecord
  class << self
    def create_random
      100.times { |i| create name: SecureRandom.alphanumeric(16) }
    end
  end
end
