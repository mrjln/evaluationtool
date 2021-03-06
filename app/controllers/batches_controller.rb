class BatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @batches = Batch.all
  end

  def show
    @batch = Batch.find(params[:id])
    @students = @batch.students
    @percentage_red = @batch.return_percentage("red").round(2)
    @percentage_yellow = @batch.return_percentage("yellow").round(2)
    @percentage_green = @batch.return_percentage("green").round(2)
    @selected_student = @batch.student_to_ask_question
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)
    @batch.get_start_end_date
    if @batch.save
          redirect_to "/batches", notice: 'Batch added'
      else
        redirect_to "/batches", notice: 'Somethin went wrong'
      end
  end

  private

  def batch_params
      params.require(:batch).permit(:number, :starts_at)
    end

end
