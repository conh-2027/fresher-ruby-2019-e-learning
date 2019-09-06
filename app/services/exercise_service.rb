class ExerciseService
  def initialize exercise, course_id, results
    @exercise = exercise
    @course_id = course_id
    @results = results
  end
  
  def load_questions
    rand_questions = Question.load_question_of_course(@course_id).order("RAND()")
    @questions = rand_questions.limit Settings.exercises.question_number
  end

  def create_exercise_detail
    load_questions.each do |question|
      ExerciseDetail.create! question_id: question.id, exercise_id: @exercise.id
    end
  end

  def get_correct_answers
    correct_answers = {}
    @exercise.questions.each do |question|
      correct_answers[question.id] = question.answers.is_corrects.first.id
    end
    correct_answers
  end
  
  def result_handle
    point = 0
    @results = @results[:exercise_details_attributes].values
    
    get_correct_answers.each do |correct_answer|
      byebug
      @results.each do |answer|
        question_id = answer.values[0].to_i
        answer_id = answer.values[1].to_i
        
        next unless question_id == correct_answer[0] && answer_id == correct_answer[1]
        point += 1
      end
    end
    @exercise.update result: point
  end
end
