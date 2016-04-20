require 'station'

describe Station do
  subject{ described_class.new("name", "zone")}

  it "is created with a name" do
    expect(subject.name).to eq "name"
  end

  it "is created with a zone" do
    expect(subject.zone).to eq "zone"
  end

end
