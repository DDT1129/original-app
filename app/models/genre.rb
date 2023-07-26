class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '外出' },
    { id: 3, name: '帰宅' }
  ]
  include ActiveHash::Associations
  has_many :situations
end