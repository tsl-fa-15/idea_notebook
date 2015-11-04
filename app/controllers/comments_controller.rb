class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
    @idea = Idea.find(@comment.idea_id)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.contents = params[:contents]
    @comment.idea_id = params[:idea_id]

    if @comment.save
      redirect_to comments_url, :notice => "Comment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.contents = params[:contents]
    @comment.idea_id = params[:idea_id]

    if @comment.save
      redirect_to comment_url(@comment.id), :notice => "Comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, :notice => "Comment deleted." }
      format.js { render 'destroy'}
    end

  end
end
