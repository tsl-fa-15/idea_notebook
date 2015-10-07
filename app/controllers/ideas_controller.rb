class IdeasController < ApplicationController
  def show
    if params[:id] == "1"
      @idea = "First idea"
    elsif params[:id] == "2"
      @idea = "Second Idea"
    end
  end
end
