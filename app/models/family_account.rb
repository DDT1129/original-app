class FamilyAccount < ApplicationRecord
  has_many :user
  validates :family_code, length: { minimum: 6 }, format: { with: /\A\d{6}+\z/ }
end
