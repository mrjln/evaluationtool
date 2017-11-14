class Batch < ApplicationRecord
  has_many :students


  def student_to_ask_question
    color_selector = self.pick_semi_random_color
    students_grouped = self.students_grouped_by_color(color_selector)

    random_student = students_grouped.sample
    return random_student
  end

  def students_grouped_by_color(randomcolor)
    students_grouped = []
      self.students.each do |student|
          students_grouped << student if student.evaluations.last.color == randomcolor
      end
      return students_grouped
  end

  def pick_semi_random_color
    #50% chance to pick red = 4x , 33% chance to pick yellow = 2x, 17% chance to pick green = 1x
    chances_colors = ["red","red","red","yellow","yellow","green"]
    color_selector = chances_colors.sample
    return color_selector
  end


  def return_percentage(color)
  @totalstudents = self.students.count
  @group_of_students = self.students_grouped_by_color(color)
  @amount_of_students_with_color = @group_of_students.count
  @percentage = ((@amount_of_students_with_color.to_d / @totalstudents.to_d)*100)
  @integer = @percentage.to_i
  return @integer
  end

end
