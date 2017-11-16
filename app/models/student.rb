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
    n = 0
    ten_weeks_in_days = 70
    @all_evaluations = self.evaluations
    if !@all_evaluations.empty?
        @all_evaluations.each do |evaluation|
          if evaluation.evaluation_date == Date.today - n
            @most_recent_evaluation = evaluation
            break
          else
            n =+ 1
            break if n > ten_weeks_in_days
          end
        end
    else
        return "No evaluation yet or evaluation is more than 10 weeks ago"

        return @most_recent_evaluation
    end
  end
end
