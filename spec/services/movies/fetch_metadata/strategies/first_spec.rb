require 'rails_helper'

RSpec.describe Movies::FetchMetadata::Strategies::First do
  subject(:strategy) { described_class.new(collection: collection) }

  describe '#call' do
    let(:collection) { [ { 'id' => 1, 'title' => 'Inception' }, { 'id' => 2, 'title' => 'Other' } ] }

    it 'returns the first item from the collection' do
      expect(strategy.call).to eq(collection.first)
    end
  end
end
