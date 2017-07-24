class Encounter < ApplicationRecord
  belongs_to :patient
  validates :visit_no, :admitted_at, :presence => true
end
