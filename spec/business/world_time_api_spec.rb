require_relative '../../lib/business/world_time_api.rb'

RSpec.describe Business::WorldTimeApi do
  # SUCCESSFUL_RESPONSE = 'date_example'
  # ERROR_RESPONSE = "{\"error\":\"unknown location\"}"

  describe '.get_time' do
    subject { Business::WorldTimeApi.get_time(area, location) }
    let(:area) { 'America' }
    let(:location) { 'Montevideo' }
    let(:response) { double }

    context 'when area and location are correct' do
      it 'returns date and time returned by World Time Api service' do
        allow(Services::WorldTimeApi).to receive(:get_time).and_return('date_example')
        is_expected.to eq('date_example')
      end
    end

    context 'when area is incorrect' do
      let(:area) { 'Aerica' }
      it 'returns error message' do
        allow(Services::WorldTimeApi).to receive(:get_time).and_raise(TimeZoneNotFoundError)
        expect { Business::WorldTimeApi.get_time(area, location) }.to raise_error(TimeZoneNotFoundError)
      end
    end

    context 'when location is incorrect' do
      let(:location) { 'Montevid' }
      it 'returns error message' do
        allow(Services::WorldTimeApi).to receive(:get_time).and_raise(TimeZoneNotFoundError)
        expect { Business::WorldTimeApi.get_time(area, location) }.to raise_error(TimeZoneNotFoundError)
      end
    end
  end
end