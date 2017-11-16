class CommentsController < ApplicationController
  before_action :set_batch
  before_action :set_student
  before_action :set_evaluation
  before_action :authenticate_user!


def create
  @comment = @evaluation.comments.build(comment_params)
  @comment.user_id = current_user.id
  @comment.save
  if @comment.save
      redirect_to batch_student_path(@batch, @student), notice: 'Commented'
  else
      redirect_to batch_student_path(@batch, @student), notice: 'Something Commenty went wrong'
  end

  end

  private

  def set_batch
   @batch = Batch.find(params[:batch_id])
  end

  def set_student
   @student = @batch.students.find(params[:student_id])
  end

  def set_evaluation
   @evaluation = @student.most_recent_evaluation
  end


def comment_params
  params.require(:comment).permit(:content, :evaluation_id, :user_id)

end

end
