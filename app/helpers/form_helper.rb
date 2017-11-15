module FormHelper
  def setup_student(student)
    student.evaluations ||= Evaluation.new
    student
  end
end
