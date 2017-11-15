class EvaluationsController < ApplicationController

  def index
    @evaluations = @student.evaluations
    @evaluation = Evaluation.new
  end

  def show
      @evaluation= Evaluation.find(params[:id])
  end

  def new
    @evaluation= Evaluation.new
    @student = Student.find(params[:id])
  end
end
