class Batch < ApplicationRecord
  has_many :students

  validates :number, presence: true


  def student_to_ask_question
    @totalstudents = self.students.count
    random_student = nil
    all_evaluations = self.all_evaluations
      if @totalstudents != 0 || all_evaluations.count != 0
          color_selector = self.pick_semi_random_color
          students_grouped = self.students_grouped_by_color(color_selector)
            #return self.student_to_ask_question if students_grouped.empty?
          random_student = students_grouped.sample
        end
    return random_student
  end

  def students_grouped_by_color(randomcolor)
    @totalstudents = self.students.count
    if @totalstudents != 0
        students_grouped = []
          self.students.each do |student|
            break if student.evaluations.empty?
              students_grouped << student if student.evaluations.last.color == randomcolor
          end
    end
    return students_grouped
  end

  def pick_semi_random_color
    #50% chance to pick(red = 3x), 33% chance to pick (yellow = 2x), 17% chance to pick (green = 1x)
    chances_colors = ["red","red","red","yellow","yellow","green"]
    color_selector = chances_colors.sample
    return color_selector
  end

  def all_evaluations
    @all_evaluations = []
    self.students.each do |student|
       @all_evaluations << student.evaluations if !student.evaluations.empty?
    end
    return @all_evaluations
  end


  def return_percentage(color)
    @totalstudents = self.students.count
    @percentage = 0.0
    if @totalstudents != 0
        @group_of_students = self.students_grouped_by_color(color)
        @amount_of_students_with_color = @group_of_students.count
        @percentage = ((@amount_of_students_with_color.to_f / @totalstudents.to_f)*100)
    end
    return @percentage
  end

def get_start_end_date
  self.starts_at = Date.today if self.starts_at.nil?
  start_date = self.starts_at.beginning_of_week
  last_day_of_week = start_date + 5.days
  self.ends_at = last_day_of_week + 9.weeks
end

def next_student(student)
  amount_students = self.students.count
  students_in_class = self.students
  index = students_in_class.index(student)
  amount_students = amount_students - 1
  if index != amount_students
    index_next_student = index + 1
  else
    index_next_student = index
  end
    @next_student = students_in_class[index_next_student]
    return @next_student
end


end
