require 'journey'

describe Journey do

  it {is_expected.to respond_to(:fare)}

  let(:journey) {subject{ described_class.new}}
  let(:stn1) 	{ double :station, name: "stn1", zone: 1 }
	let(:stn2) 	{ double :station, name: "stn2", zone: 5 }
  let(:un_finished_journey) {{start: ["stn1", 1]}}
  let(:finished_journey) {{start: ["stn1", 1], finish: ["stn2", 5]}}


  it 'before journey starts log is empty' do
    expect(journey.log).to be_empty
  end

  describe "#start" do
    it 'expects to check station name' do
      expect(stn1).to receive(:name)
      journey.start stn1
    end

    it 'expects to check station zone' do
      expect(stn1).to receive(:zone)
      journey.start stn1
    end

    it "log describes half journey" do
      journey.start stn1
      expect(journey.log).to eq un_finished_journey
    end
  end

  describe "#finish" do
    it 'expects to check station name' do
      expect(stn1).to receive(:name)
      journey.start stn1
    end

    it 'expects to check station zone' do
      expect(stn1).to receive(:zone)
      journey.start stn1
    end

    it 'log describes full journey' do
      journey.start stn1
      journey.finish stn2
      expect(journey.log).to eq finished_journey
    end
  end
  describe "#fare" do
    it 'penalty fare if just tap out' do
      pen_fare = described_class::PEN_FARE
      journey.finish stn2
      expect(journey.fare).to eq pen_fare
    end

    it 'min fare if tap out and tap in' do
      min_fare = described_class::MIN_FARE
      journey.start stn1
      journey.finish stn2
      expect(journey.fare).to eq min_fare
    end
    #
    # it 'unfinished journey to be PEN_FARE' do
    #   pen_fare = described_class::PEN_FARE
    #   expect(journey.fare).to eq pen_fare
    #   journey.start stn1
    #   expect(journey.fare).to eq pen_fare
    # end
  end

end
