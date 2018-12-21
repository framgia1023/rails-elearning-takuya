class Administrator::WordsController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times { @word.choices.build }
  end
  
  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Successfully Create Word."
      redirect_to administrator_category_words_url
    else
      render 'new'
    end
  end

  def index
    @category = Category.find(params[:category_id])
    @words = @category.words
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])    
    @word = @category.words.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "Successfully Updated Words."
      redirect_to administrator_category_words_url
    else
      render 'edit'
    end
  end
  
  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to administrator_category_words_url
  end

  private
  def word_params
    params.require(:word).permit(:word, :category_id, choices_attributes:[:id, :choice, :correct])
  end

end