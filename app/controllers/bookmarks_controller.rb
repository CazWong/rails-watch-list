class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:movie_id])
    @bookmark.list = @list
    @bookmark.movie = @movie
    @bookmark.save(params_bookmark)
    if @bookmark.valid?
      @bookmark.save
    else
      @bookmark = Bookmark.new(list_id: params[:list_id])
    end
    redirect_to list_path(id: @bookmark.list_id), notice: "Bookmark saved!"
  end

  def destroy
    @bookmark = bookmark.find(params[:id])
    @bookmark.destroy

    # no need for app/views/restaurants/destroy.html.erb
    # redirect_to restaurants_path
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:content)
  end
end
