class Patient < ApplicationRecord
  has_many :encounters, dependent: :destroy
  validates :first_name, :middle_name, :mrn, :presence => true
end
