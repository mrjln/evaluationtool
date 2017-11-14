class Student < ApplicationRecord
  belongs_to :batch

  has_many :photos,  dependent: :destroy
  has_many :evaluations, dependent: :destroy 
end
