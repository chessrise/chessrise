class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :destroy]
  before_action :set_ply, only: [:edit, :new, :destroy]

  def index
  end

  def edit
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
  end

  def show
  end

  def destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_ply
    @ply = Ply.find(params[:ply_id])
  end
end
