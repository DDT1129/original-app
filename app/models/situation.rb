class Situation < ApplicationRecord

  validates :situation, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

end
