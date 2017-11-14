class Student < ApplicationRecord
  belongs_to :batch

  has_many :photos,  dependent: :destroy 
end
