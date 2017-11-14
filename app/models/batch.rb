class Batch < ApplicationRecord
  has_many :students



  def create_array_of_students
    @array_of_students = []
    self.students.each do |student|
      @array_of_students << student.name
    end

    return @array_of_students
  end

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
    #50% chance to pick red, 33% chance to pick yellow, 17% chance to pick green
    chances_colors = ["red","red","red","yellow","yellow","green"]
    color_selector = chances_colors.sample
    return color_selector
  end


  def return_percentage(color)
  @totalstudents = self.students.count
  students_grouped = []

    self.students.each do |student|
        students_grouped << student if student.evaluations.last.color == color
    end

  @students_with_color = students_grouped.count
  @percentage = (@students_with_color / @totalstudents)*100

  return @percentage
  end
end
