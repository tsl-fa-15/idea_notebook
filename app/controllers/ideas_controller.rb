class IdeasController < ApplicationController
  def show
    @idea = Idea.find(params[:id])
  end

  def new
  end

  def create
    idea = Idea.new
    idea.desc = params[:desc]
    idea.save

    redirect_to "/ideas/#{idea.id}"
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    idea = Idea.find(params[:id])
    idea.desc = params[:desc]
    idea.save

    redirect_to "/ideas/#{idea.id}"
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy

    redirect_to "/ideas"
  end

  def index
    @ideas = Idea.all
  end

end
