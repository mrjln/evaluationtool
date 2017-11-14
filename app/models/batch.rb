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
end
