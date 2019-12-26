require_relative '../../lib/services/world_time_api.rb'

RSpec.describe Services::WorldTimeApi do
  SUCCESSFUL_RESPONSE = "{\"datetime\": \"date_example\"}"
  ERROR_RESPONSE = "{\"error\":\"unknown location\"}"
  WORLD_TIME_API_URL = 'http://worldtimeapi.org/api/timezone'

  describe '.get_time' do
    subject { Services::WorldTimeApi.get_time(area, location) }
    let(:area) { 'America' }
    let(:location) { 'Montevideo' }
    let(:response) { double }

    context 'when area and location are correct' do
      it 'returns date and time returned by World Time Api' do
        allow(response).to receive(:body).and_return(SUCCESSFUL_RESPONSE)
        allow(Net::HTTP).to receive(:get_response).and_return(response)
        is_expected.to eq('date_example')
      end
    end

    context 'when area is incorrect' do
      let(:area) { 'Aerica' }
      it 'returns error message' do
        allow(response).to receive(:body).and_return(ERROR_RESPONSE)
        allow(Net::HTTP).to receive(:get_response).and_return(response)
        expect { Services::WorldTimeApi.get_time(area, location) }.to raise_error(TimeZoneNotFoundError)
      end
    end

    context 'when location is incorrect' do
      let(:location) { 'Montevid' }
      it 'returns error message' do
        allow(response).to receive(:body).and_return(ERROR_RESPONSE)
        allow(Net::HTTP).to receive(:get_response).and_return(response)
        expect { Services::WorldTimeApi.get_time(area, location) }.to raise_error(TimeZoneNotFoundError)
      end
    end
  end
end