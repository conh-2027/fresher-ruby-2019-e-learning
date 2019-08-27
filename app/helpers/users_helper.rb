module UsersHelper
  def build_relationship
    current_user.active_relationships.build
  end
  
  def load_relationship user_id
    current_user.active_relationships.find_by followed_id: user_id
  end
end
