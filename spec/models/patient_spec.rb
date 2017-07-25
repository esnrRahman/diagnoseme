require 'rails_helper'

RSpec.describe Patient, :type => :model do
  subject { described_class. new }

  describe "Validations" do
    it "is not valid without a first name" do
      expect(subject).to_not be_valid
    end

    it "is not valid without a middle name" do
      subject.first_name = "FName"
      expect(subject).to_not be_valid
    end

    it "is not valid without a mrn" do
      subject.first_name = "FName"
      subject.middle_name = "MName"
      expect(subject).to_not be_valid
    end

    it "is valid with valid attributes" do
      subject.first_name = "FName"
      subject.middle_name = "MName"
      subject.mrn = "THC001"
      expect(subject).to be_valid
    end
  end


  describe "Associations" do
    # it "has many encounters" do
    #   assc = described_class.reflect_on_association(:encounters)
    #   expect(assc.macro).to eq :has_many
    # end
    it { should have_many(:encounters) }
  end
end
