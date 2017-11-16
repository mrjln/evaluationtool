class StudentsController < ApplicationController
  before_action :set_batch

  def show
    @student = Student.find(params[:id])
    @photos = @student.photos
    @evaluations =  @student.evaluations
    @studentcolor = @evaluations.empty? ? "no evaluation yet" : @evaluations.last.color

    @evaluation = Evaluation.new
    @comment = Comment.new
    @next_student = @batch.next_student(@student)

    @comments = @evaluations.empty? ? "no comments yet" : Comment.where(evaluation_id: @student.most_recent_evaluation).order("created_at DESC")

  end

  def new
     @student = @batch.students.build
  end

  def edit
    @student = @batch.students.find(params[:id])
    @photos = @student.photos
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

  def update
    @student = @batch.students.find(params[:id])

    if @student.update(student_params)
      image_params.each do |image|
         @student.photos.create(image: image)
      end
      redirect_to batch_path(@batch), notice: "student updated"
    else
      render :edit
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

   def image_params
     params[:images].present? ? params.require(:images) : []
   end
 #This symbol is called :images because it is defined in the photos.rb. via the ImageUploader


end
