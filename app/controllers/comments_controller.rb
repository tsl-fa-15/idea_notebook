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
      respond_to do |format|
        format.html { redirect_to comments_url, :notice => "Comment created successfully." }
        format.js { render 'create'}
      end
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html { render 'edit' }
      format.js { render 'edit' }
    end
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.contents = params[:contents]
    @comment.idea_id = params[:idea_id]

    if @comment.save
      respond_to do |format|
        format.html { redirect_to comment_url(@comment.id), :notice => "Comment updated successfully." }
        format.js { render 'update' }
      end

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
