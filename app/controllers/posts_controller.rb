class PostsController < ApplicationController
  def index
    ids = current.user.following.ids << current_user.id
    @posts = Post.where(user_id: ids).order(created_at: :desc)
  end
end
