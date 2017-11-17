class EvaluationsController < ApplicationController
before_action :set_batch
before_action :set_student
#before_action :evaluation_exists

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
    @next_student = @batch.next_student(@student)
    if params[:submitformname] == 'Add Evaluation'
          @evaluation = @student.evaluations.build(evaluation_params)
          #if !@student.evaluation_exists(@evaluation.evaluation_date)

           if @evaluation.save
           redirect_to batch_student_path(@batch, @student),notice: "Evaluation added"
          else
            redirect_to batch_student_path(@batch, @student), notice: 'No evaluation added'
          end
    elsif params[:submitformname] == 'Save and next student'
          @evaluation = @student.evaluations.build(evaluation_params)
          #if !@student.evaluation_exists(@evaluation.evaluation_date)
           if @evaluation.save
           redirect_to "/batches/#{@batch.id}/students/#{@next_student.id}"
          else
            redirect_to batch_student_path(@batch, @student), notice: 'No evaluation added'
          end
    end
end


#def create_and_next
#  @next_student = @batch.next_student(@student)
#  @evaluation = @student.evaluations.build(evaluation_params)
#  if @evaluation.save
#  redirect_to "/batches/#{batch.id}/students/#{@next_student.id}"
 #else
#   redirect_to batch_student_path(@batch, @student), notice: 'No evaluation added'
# end

#end
  private

  #def evaluation_exists
#
  #end
  def set_batch
   @batch = Batch.find(params[:batch_id])
  end

  def set_student
   @student = @batch.students.find(params[:student_id])
  end

  def evaluation_params
      params.require(:evaluation).permit(:color, :evaluation_date, :student_id, comments: [])
  end
end
