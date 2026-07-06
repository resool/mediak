require 'rails_helper'

RSpec.describe Movies::Extract::Service do
  subject(:service) { described_class.new(**params) }

  let(:params) do
    {
      iso_path: file_fixture('movie.iso').to_s
    }
  end

  describe '#call' do
    subject(:call) { service.call }

    it 'returns a path to existing file' do
      expect(File.exist?(call)).to be true
      expect(File.extname(call)).to eq(".mkv")
    end
  end
end