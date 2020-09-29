require 'rails_helper'
require_relative './benchmark_worker_spec.rb'

RSpec.describe PureWorker, type: :worker do
  it_behaves_like 'Benchmark Worker'
end
