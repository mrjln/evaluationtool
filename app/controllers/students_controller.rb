class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    @batch = @student.batch
  end

  def new
    @student= Student.new
  end
end
