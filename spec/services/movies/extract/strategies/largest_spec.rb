require 'rails_helper'

RSpec.describe Movies::Extract::Strategies::Largest do
  subject(:strategy) { described_class.new(**params) }

  describe '#call' do
    subject(:call) { strategy.call }

    let(:params) do
      {
        collection: Dir["#{file_fixture('video_samples')}/*"]
      }
    end

    it 'chose the larger file' do
      expect(call).to eq('spec/fixtures/files/video_samples/large.mkv')
    end
  end
end
