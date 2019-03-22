class LessonsController < ApplicationController

  def new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.save
    @lesson.create_activity(user_id: current_user.id)
    redirect_to new_lesson_answer_url(@lesson)
  end

  def show
    @lesson = Lesson.find(params[:id])
    @answers = Answer.where(lesson_id: params[:id])
  end

  private
  def lesson_params
    params.require(:lesson).permit(:lesson_id, :user_id, :category_id)
  end

end
