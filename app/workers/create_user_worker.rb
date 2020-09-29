class CreateUserWorker
  include Sidekiq::Worker
  include TimeElapsable

  def perform(id)
    @id = id
    record_first
    User.create_random
    record_current
  end
end
