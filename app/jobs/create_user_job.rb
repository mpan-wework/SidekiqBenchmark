class CreateUserJob < ApplicationJob
  queue_as :default

  def perform(id)
    @id = id
    record_first
    User.create_random
    record_current
  end
end
