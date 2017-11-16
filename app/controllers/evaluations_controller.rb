class EvaluationsController < ApplicationController
before_action :set_batch
before_action :set_student

  def index
    @evaluations = @student.evaluations
    @evaluation = Evaluation.new
  end

  def show
      @evaluation= Evaluation.find(params[:id])
  end

  def new
    @evaluation= Evaluation.new
    @student = @batch.student.find(params[:id])
  end

  def create
    @evaluation = @student.evaluations.build(evaluation_params)
    if @student.evaluation_exists(@evaluation.evaluation_date)
      redirect_to batch_student_path(@batch, @student), notice: 'This student already has an evaluation for this date'
    else
          if @evaluation.save
              redirect_to batch_student_path(@batch, @student), notice: 'Evaluation created'
          else
            redirect_to batch_student_path(@batch, @student), notice: 'No evaluation added'
          end
    end

  end


  private


  def set_batch
   @batch = Batch.find(params[:batch_id])
  end

  def set_student
   @student = @batch.students.find(params[:student_id])
  end

  def evaluation_params
      params.require(:evaluation).permit(:color, :evaluation_date, :student_id)
  end
end
