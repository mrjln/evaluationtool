class BatchesController < ApplicationController

  def index
    @batches = Batch.all
  end

  def show
    @batch = Batch.find(params[:id])
    @selected_student = @batch.student_to_ask_question
  end

  def show_selected_student
   render :partial=>"batches/selected_student"
  end

end
