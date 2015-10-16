class TopController < ApplicationController
  def index
  end

  def submit
    if params[:name].present?
      reload_popup '/reloaded'
      redirect_to :done
    else
      @error = "Can't be blank"
      close_popup
      render :index
    end
  end

  def done
  end

  def reloaded
  end
end