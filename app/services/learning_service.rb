class LearningService
  def initialize user, word
    @user = user
    @word = word
  end

  def mark_learned
    learning = Learning.find_by user_id: @user.id, word_id: @word.id
    return if learning
    @user.learnings.build(word_id: @word.id).save
  end
end
