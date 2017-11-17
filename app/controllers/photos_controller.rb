class PhotosController < ApplicationController
before_action :authenticate_user!

  def destroy
      photo = Photo.find(params[:id])
      @student = photo.student
      @batch = @student.batch
      photo.destroy
      redirect_to edit_batch_student_path(@batch, @student), notice: "Photo removed"
    end


end
