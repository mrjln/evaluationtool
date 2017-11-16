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

  def most_recent_evaluation
    i = 0
    days_number = 0
    ten_weeks_in_days = 70
    @all_evaluations = self.evaluations
    if @all_evaluations.empty?
      return "No evaluation yet or evaluation is more than 10 weeks ago"
    else
      while days_number < ten_weeks_in_days do
        @all_evaluations.each do |evaluation|
        if evaluation.evaluation_date == Date.today - days_number.days
          @most_recent_evaluation = evaluation
        else
          @most_recent_evaluation = "not found"
        end #end of ifstatementinsideeach
        days_number += 1
      end #end each

      end #endwhileloop


      return @most_recent_evaluation
    end #end ifstatement
  end #end method


  def find_evaluation(date)
    @all_evaluations = self.evaluations
    @all_evaluations.each do |evaluation|
      if evaluation.evaluation_date == date
        return true
      end
    end
    return false 
  end

end #end class
