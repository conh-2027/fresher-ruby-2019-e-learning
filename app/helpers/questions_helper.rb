module QuestionsHelper
  def load_answers question
    question.answers.is_corrects.pluck :content
  end

  def load_words
    Word.pluck :name, :id
  end
end
