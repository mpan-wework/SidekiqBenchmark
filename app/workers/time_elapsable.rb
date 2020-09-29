module TimeElapsable
  private

  def record_first
    return if @id != 0

    start_time = DateTime.now.strftime('%Q')
    Rails.cache.write("#{self.class}-#{@id}", start_time)
  end

  def record_current
    end_time = DateTime.now.strftime('%Q')
    Rails.cache.write(self.class, "#{@id}, #{end_time}")
  end
end
