class StudentsController < ApplicationController
  before_action :set_batch

  def show
    @student = Student.find(params[:id])
  end

  def new
     @student = @batch.students.build
  end

  def create
      @student = @batch.students.build(student_params)

      if @student.save
          redirect_to batch_path(@batch), notice: 'Student added'
      else
        redirect_to batch_path(@batch), notice: 'Student was not added'
      end
  end


  private

  def set_batch
   @batch = Batch.find(params[:batch_id])
 end


  def student_params
   params
     .require(:student)
     .permit(:name, evaluations:[])

   end

end
