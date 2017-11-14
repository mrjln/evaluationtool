class Batch < ApplicationRecord
  has_many :students



  def create_array_of_students
    @array_of_students = []
    self.students.each do |student|
      @array_of_students << student.name
    end

    return @array_of_students
  end

  def students_evaluation(string)
    @filtered_array_of_students = []

  end

  def self.pick_semi_random_color
#50% chance to pick red, 33% chance to pick yellow, 17% chance to pick green
    chances_colors = ["red","red","red","yellow","yellow","green"]
    color_selector = chances_colors.sample
    return color_selector

  end
end
