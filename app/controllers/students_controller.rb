class StudentsController < ApplicationController
  before_action :set_batch

  def show
    @student = Student.find(params[:id])
    @evaluations = @student.evaluations
    @evaluation = Evaluation.new
  end

  def new
     @student = @batch.students.build
  end

  def create
      @student = @batch.students.build(student_params)

      if @student.save
        image_params.each do |image|
          @student.photos.create(image: image)
        end
          redirect_to batch_path(@batch), notice: 'Student added'
      else
        redirect_to batch_path(@batch), notice: 'Student was not added'
      end
  end

  def destroy
        @student = @batch.students.find(params[:id])
        @student.destroy
        redirect_to @batch, notice: "Student deleted!"
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

   def image_params
     params[:images].present? ? params.require(:images) : []
   end
 #This symbol is called :images because it is defined in the photos.rb. via the ImageUploader


end
