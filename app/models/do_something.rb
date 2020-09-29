class DoSomething
  def self.execute(klass)
    100.times { |i| Rails.cache.write klass, i }
  end
end
