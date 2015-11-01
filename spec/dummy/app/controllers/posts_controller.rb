class PostsController < ApplicationController
  def new
    @post = Post.new
    @view = params[:view]
    render @view
  end

  def create
    @post = Post.new(params[:post].permit(:body))
    if @post.valid?
      reload_popup reload_posts_path
      redirect_to :done_posts
    else
      @error = "Can't be blank"
      @view = params[:view]
      close_popup
      render @view
    end
  end

  def src
  end

  def done
  end

  def reload
  end
end