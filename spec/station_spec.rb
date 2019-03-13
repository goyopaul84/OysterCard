require 'station'
describe Station do
  let(:name) { double :name }
  let(:zone) { double :zone }
  it "exposes the name" do
    station = Station.new(name, zone)
    expect(station.name).to eq name
  end

  it "exposes the zone" do
    station = Station.new(name, zone)
    expect(station.zone).to eq zone
  end
end
