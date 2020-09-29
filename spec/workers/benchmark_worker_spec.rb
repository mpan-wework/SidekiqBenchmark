if defined? ::BENCHMARK_WORKER
  return
end

::BENCHMARK_WORKER = 1

RSpec.shared_examples 'Benchmark Worker' do
  before { Rails.cache.clear }
  let!(:count) { 500 }

  it 'runs for 501 times' do
    Sidekiq::Testing.inline! do
      (count + 1).times { |i| described_class.perform_async i }
    end
    p "#{described_class}-0, #{Rails.cache.read("#{described_class}-0")}"
    p "#{described_class}-last, #{Rails.cache.read("#{described_class}")}"
  end
end
