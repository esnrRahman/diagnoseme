require 'rails_helper'

RSpec.describe Encounter, :type => :model do
  subject { described_class. new }

  describe "Validations" do
    it "is not valid without a visiter number" do
      expect(subject).to_not be_valid
    end

    it "is not valid without an admitted date" do
      subject.visit_no = "VN0001"
      expect(subject).to_not be_valid
    end

    it "is not valid without a patient id" do
      subject.visit_no = "VN0001"
      subject.admitted_at = DateTime.new(2001,2,3,4,5,6)
      expect(subject).to_not be_valid
    end

    it "is valid with valid attributes" do
      patient = Patient.create(first_name: "FName", middle_name: "MName", mrn:"THC001")
      encounter = Encounter.create(visit_no: "VN0001",
                                   admitted_at: DateTime.new(2001,2,3,4,5,6),
                                   patient_id: patient.id)
      expect(encounter).to be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:patient) }
  end
end
