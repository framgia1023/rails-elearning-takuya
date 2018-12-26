class AnswersController < ApplicationController

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @lessons = Lesson.where(user_id: @lesson.user_id, category_id: @lesson.category_id)
    correct_count = @lesson.choices.where(correct: true).count
    if @lesson.next_word.nil?
      @lessons.update(result: correct_count)
      flash[:success] = "You learned this category!!"
      redirect_to lesson_url(params[:lesson_id])
    end
    @answer = @lesson.answers.build
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.build(answer_params)
    @answer.save
    redirect_to new_lesson_answer_url
  end
  
  private
  def answer_params
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
  end
end
