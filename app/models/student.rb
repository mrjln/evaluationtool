class Student < ApplicationRecord
  belongs_to :batch

  has_many :photos,  dependent: :destroy
  has_many :evaluations, dependent: :destroy


  def evaluation_exists(date)
    evaluations_hash =  self.create_hash

    if evaluations_hash.key?(date)
      return true
    else
      return false
    end

  end


  def create_hash
  evaluations_hash = Hash.new

    self.evaluations.each do |evaluation|
      evaluations_hash[evaluation.evaluation_date] = evaluation.color
    end

  return evaluations_hash
  end


end
