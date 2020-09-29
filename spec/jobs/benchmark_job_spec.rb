if defined? ::BENCHMARK_JOB
  return
end

::BENCHMARK_JOB = 1

RSpec.shared_examples 'Benchmark Job' do
  before { Rails.cache.clear }
  let!(:count) { 500 }

  it 'runs for 501 times' do
    perform_enqueued_jobs do
      (count + 1).times { |i| described_class.perform_later i }
    end

    p "#{described_class}-0, #{Rails.cache.read("#{described_class}-0")}"
    p "#{described_class}-last, #{Rails.cache.read("#{described_class}")}"
  end
end
