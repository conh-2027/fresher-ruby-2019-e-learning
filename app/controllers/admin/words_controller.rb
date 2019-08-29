class Admin::WordsController < Admin::BaseController
  before_action :load_word, except: %i(index new create)
  
  def index
    @words = Word.order(created_at: :desc).page(params[:page])
      .per Settings.words.paging.page_nummber
  end

  def new
    @word = Word.new
  end

  def create 
    @word = Word.new word_params
    
    if @word.save
      flash[:success] = t ".success_created"
      redirect_to admin_words_path
    else
      flash[:danger] = t ".fail_create"
      render :new
    end
  end

  def update
    if @word.update word_params
      flash[:success] = t ".success_updated"
      redirect_to admin_words_path
    else
      flash[:fail] = t ".fail_update"
      render :edit
    end
  end

  def destroy
    if @word.destroy
      flash[:success] = t ".success_destroyed"
    else
      flash[:danger] = t ".fail_destroy"
    end
    redirect_to admin_words_path
  end

  private
  
  def word_params
    params.require(:word).permit Word::WORD_PARAMS
  end

  def load_word
    @word = Word.find_by id: params[:id]

    return if @word
    flash[:danger] = t ".not_found"
    redirect_to admin_words_path
  end
end
