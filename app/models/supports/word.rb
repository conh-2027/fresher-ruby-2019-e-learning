class Supports::Word
  attr_reader :course, :page

  def initialize course, page
    @course = course
    @page = page
  end

  def load_words
    @course.words.page(@page).per Settings.words.learning.paging_number
  end
end
