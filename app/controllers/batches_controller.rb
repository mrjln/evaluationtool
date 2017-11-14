class BatchesController < ApplicationController

  def index
    @batches = Batch.all
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def update
    @batch = Batch.find(params[:id])
    @students = @batch.students
  end
end
