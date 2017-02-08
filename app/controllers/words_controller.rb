class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update]

  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)

    if @word.save
      render :index
    else
      redirect_to @word
    end
  end

  def remove_all
    Word.delete_all

    redirect_to words_path
  end

  def generate
    @words = Word.all
    arr = []
    @words.each do |w|
      arr << w.name
      if arr.size <= 3
        puts "not enough words to generate"
      else
        @result = arr.permutation(arr.size).to_a
      end
    end
  end


  private

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:name)
  end
end
