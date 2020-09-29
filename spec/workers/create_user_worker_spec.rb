require 'rails_helper'
require_relative './benchmark_worker_spec'

RSpec.describe CreateUserWorker, type: :worker do
  it_behaves_like 'Benchmark Worker'
end
