require 'rails_helper'

RSpec.describe PureJob, type: :job do
  before { Rails.cache.clear }

  it 'runs for 100 times' do
    count = 100
    perform_enqueued_jobs do
      (count + 1).times { |i| described_class.perform_later i }
    end

    p "#{described_class}-0,#{Rails.cache.read("#{described_class}-0")}"
    p "#{described_class}-#{count},#{Rails.cache.read("#{described_class}-#{count}")}"
  end
end
