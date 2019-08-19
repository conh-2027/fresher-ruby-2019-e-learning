module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".e_learning"
    page_title.empty? ? base_title : base_title + "|" + page_title
  end
  
  def index_of_list object, counter
    (object.current_page - 1) * object.limit_value + counter + 1
  end
end
