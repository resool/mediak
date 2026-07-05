require 'rails_helper'

RSpec.describe Movies::FetchMetadata::Serializer do
  subject(:serializer) do
    described_class.new(**params)
  end

  let(:params) do
    {
      result_array: result_array,
      fetch_movie_strategy: strategy
    }
  end

  let(:strategy) { Movies::FetchMetadata::Strategies::First }
  let(:result_array) { JSON.parse(file_fixture('themoviedb/movies/search_result.json').read) }

  describe '#to_h' do
    subject(:to_h) { serializer.to_h }

    context 'with results' do
      it { is_expected.to be_kind_of(Hash) }

      describe 'serialized keys' do
        subject(:keys) { to_h.keys }

        let(:expected_array) { [:external_id, :description, :title_pl, :title_original, :yob, :external_ids_candidates] }

        it { is_expected.to match_array(expected_array) }
      end

      context 'when theres more than one result' do
        describe 'external_ids_candidates param' do
          subject(:external_ids_candidates) { to_h[:external_ids_candidates] }
        
          it { is_expected.to be_present }
          it { is_expected.to be_kind_of Array }
        end
      end
    end

    context 'when theres no results' do
      let(:params) do
        {
          result_array: [],
          fetch_movie_strategy: Movies::FetchMetadata::Strategies::First
        }
      end
      
      it { is_expected.to be_empty }
    end
  end
end