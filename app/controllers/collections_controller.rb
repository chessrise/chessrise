 class CollectionsController < ApplicationController
  def index
    @collection = "All games"
    @collections = Collection.all
    @games = Game.all
    @game = Game.find(1)
  end

  def show
    @collection = Collection.find(params[:id])
    respond_to do |format|
      format.html { render "collections/show" }
      format.js
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update!(collection_params)
      redirect_to collections_path
    else
      render "edit"
    end
  end

  def new
    @collection = Collection.new
    @user = current_user
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    if @collection.save!
      redirect_to collections_path
    else
      render "new"
    end
  end

  def filtered

    @collection = Collection.find(params[:id])
    @games = @collection.games
    @game = @games.first
    respond_to do |format|
      format.html { redirect_to collections_path }
      format.js
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name)
  end

end
