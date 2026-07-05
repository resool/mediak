require 'rails_helper'

RSpec.describe Movies::FetchMetadata::Service do
  subject(:service) { described_class.new(**params) }

  let(:params) do
    {
      title: 'Inception',
      year: '2010'
    }
  end

  describe '#call' do
    subject(:call) { service.call }

    context 'with results in db' do
      let(:expected_result) do
        {
          :description => "Dom Cobb jest niezwykle sprawnym złodziejem, mistrzem w wydobywaniu wartościowych sekretów ukrytych głęboko w świadomości podczas fazy snu, kiedy umysł jest najbardziej wrażliwy. Wyjątkowe umiejętności Cobba uczyniły z niego ważnego gracza w świecie szpiegostwa przemysłowego, ale i najbardziej poszukiwanego zbiega, a za swoją pozycję zapłacił utratą wszystkiego, co kocha. Teraz Cobb otrzymuje szansę na odkupienie. Za sprawą jednego, ostatniego zadania może odzyskać stracone życie. Musi tylko wraz ze swym zespołem dokonać rzeczy niemożliwej: zamiast skraść myśl, zaszczepić ją w śpiącym umyśle. Jeśli im się to uda, dokonają zbrodni doskonałej. Jednak nawet najbardziej precyzyjne planowanie nie jest w stanie przygotować ich na spotkanie z niezwykłym przeciwnikiem, który potrafi przewidzieć każdy ich ruch. Wróg, którego tylko Cobb mógł się spodziewać.",
          :external_id => 27205,
          :external_ids_candidates => [64956, 973484],
          :title_original => "Inception",
          :title_pl => "Incepcja",
          :yob => 2010
        }
      end

      it 'returns serialized movie metadata' do
        VCR.use_cassette('services/movies/fetch_metadata/service/success', record: :new_episodes) do
          expect(call).to match(expected_result)
        end
      end
    end

    context 'without results in db' do
      let(:params) do
        {
          title: 'bidulek-kotelek-wspanialy',
          year: '1900'
        }
      end

      it 'returns empty hash' do
        VCR.use_cassette('services/movies/fetch_metadata/service/not_found', record: :new_episodes) do
          expect(call).to be_empty
        end
      end
    end
  end
end