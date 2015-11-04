class IdeasController < ApplicationController
  def show
    @idea = Idea.find(params[:id])
    @comments = Comment.where({idea_id: @idea.id})
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new
    @idea.desc = params[:desc]
    if @idea.save
      redirect_to idea_url(@idea.id)
    else
      render 'new'
    end

  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.desc = params[:desc]
    if @idea.save
      redirect_to idea_url(@idea.id)
    else
      render 'edit'
    end

  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.js { render 'destroy'}
    end

  end

  def index
    @ideas = Idea.all
  end

end
