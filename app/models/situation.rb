class Situation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  belongs_to :user
  
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" } 

  validates :out, inclusion: { in: [true, false] }

end
