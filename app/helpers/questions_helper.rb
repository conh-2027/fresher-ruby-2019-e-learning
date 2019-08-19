module QuestionsHelper
  def load_answers question_id
    answer_corrects = Answer.where(is_correct: true).pluck :question_id
    question_of_answer = Question.where()
  end

  def load_words
    Word.pluck :name, :id
  end
end
