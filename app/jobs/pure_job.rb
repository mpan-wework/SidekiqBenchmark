class PureJob < ApplicationJob
  queue_as :default

  def perform(id)
    start_time = DateTime.now.strftime('%Q')
    2_000.times { |i| Rails.cache.write self.class, i }
    end_time = DateTime.now.strftime('%Q')
    Rails.cache.write("#{self.class}-#{id}", "#{start_time},#{end_time}")
  end
end
