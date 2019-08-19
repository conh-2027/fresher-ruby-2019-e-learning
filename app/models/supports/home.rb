class Supports::Home
  attr_reader :user, :page

  def initialize user, page
    @user = user
    @page = page
  end

  def user_followers
    user_followers = @user.following.page(@page)
      .per Settings.following.paging_number
  end

  def user_followeds
    user_followeds = @user.followers.page(@page)
      .per Settings.follower.paging_number
  end
end
