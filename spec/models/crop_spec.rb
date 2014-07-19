require 'spec_helper'

describe Crop do
  before { @crop = Crop.new(name: "Yellow Carrot, loose", quantity: 20, unit_type: "lbs") }

  subject { @crop }

  it { should respond_to(:name) }
  it { should respond_to(:quantity) }
  it { should respond_to(:unit_type) }
  it { should respond_to(:comments) }

  it { should be_valid }

  describe "When crop has comments" do
    before { @crop.comments = "Colorful mix of many varieties" }
    it { should be_valid }
  end
end
