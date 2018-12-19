class Administrator::WordsController < ApplicationController

  def new
    @word = Word.new
  end
  
  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Successfully Create Word."
      redirect_to administrator_category_words_url
    else
      render 'administrator/words/new'
    end
  end

  def index
    @category = Category.find(params[:category_id])
    @words = @category.words
    # @words = Word.where(params[:category_id])
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "Successfully Updated Words."
      redirect_to administrator_category_words_url
    else
      render 'administrator/words/edit'
    end
  end
  
  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to administrator_category_words_url
  end

  private
  def word_params
    params.require(:word).permit(:word, :category_id)
  end

end