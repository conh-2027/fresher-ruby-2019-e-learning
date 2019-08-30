class Admin::QuestionsController < Admin::BaseController
  before_action :load_question, except: %i(index new create)

  def index
    @questions = Question.order(created_at: :desc).page(params[:page])
      .per Settings.questions.paging.paging_number
  end

  def new
    @question = Question.new
    Settings.questions.answer.times{@question.answers.build}
  end

  def create
    @question = Question.new question_params

    if @question.save
      flash[:success] = t ".success_created"
      redirect_to admin_questions_path
    else
      flash[:fail] = t ".fail_create"
      render :new
    end
  end

  def update
    if @question.update question_params
      flash[:success] = t ".success_updated"
      redirect_to admin_questions_path
    else
      flash[:fail] = t ".fail_update"
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t ".success_destroy"
    else
      flash[:fail] = t ".fail_destroy"
    end
    redirect_to admin_questions_path
  end

  private

  def question_params
    params.require(:question).permit Question::QUESTION_PARAMS
  end
  
  def load_question
    @question = Question.find_by id: params[:id]

    return if @question
    flash[:danger] = t ".not_found"
    redirect_to admin_questions_path
  end
end
