module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".e_learning"
    page_title.empty? ? base_title : base_title + "|" + page_title
  end
  
  def index_of_list object, counter
    (object.current_page - 1) * object.limit_value + counter + 1
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |build|
      render(association.to_s.singularize + "_fields", f: build)
    end
    link_to(name, "#", class: "add_field_answer", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
