module QuestionsHelper
  def load_answers question
    question.answers.correct_answer.pluck :content
  end

  def load_words
    Word.pluck :name, :id
  end
end
