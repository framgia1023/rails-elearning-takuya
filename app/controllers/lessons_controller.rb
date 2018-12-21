class LessonsController < ApplicationController

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.save
    redirect_to new_lesson_answer_url
  end

  private
  def lesson_params
    params.permit(:user_id, :category_id)
  end

end
