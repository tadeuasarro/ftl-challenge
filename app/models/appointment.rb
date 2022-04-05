class Appointment < ApplicationRecord
  validates :people, numericality: true
end
