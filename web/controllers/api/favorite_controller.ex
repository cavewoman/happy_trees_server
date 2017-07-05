defmodule HappyTreesServer.API.FavoriteController do
  use HappyTreesServer.Web, :controller

  alias HappyTreesServer.Favorite

  def index(conn, _params) do
    favorites = Repo.all(Favorite)
    json conn, favorites
  end

end
