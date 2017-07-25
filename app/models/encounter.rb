class Encounter < ApplicationRecord
  belongs_to :patient
  validates :patient_id, :visit_no, :admitted_at, :presence => true
end
