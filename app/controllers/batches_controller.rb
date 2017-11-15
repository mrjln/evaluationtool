class BatchesController < ApplicationController

  def index
    @batches = Batch.all
  end

  def show
    @batch = Batch.find(params[:id])
    @selected_student = @batch.student_to_ask_question
    @percentage_red = @batch.return_percentage("red")
    @percentage_yellow = @batch.return_percentage("yellow")
    @percentage_green = @batch.return_percentage("green")
  end

  def new
    @batch = Batch.new
  end

end
