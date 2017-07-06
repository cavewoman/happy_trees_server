defmodule HappyTreesServer.API.FavoriteController do
  use HappyTreesServer.Web, :controller

  alias HappyTreesServer.Favorite

  def index(conn, _params) do
    favorites = Repo.all(Favorite)
    json conn, favorites
  end

  def update(conn, %{"favorites" => favorites}) do
    {status, favorites} = update_or_create_favorites(favorites, {:ok, []})
    json conn, %{status: status, favorites: favorites}
  end

  def update_or_create_favorites(_, {:error, message}), do: {:error, message}
  def update_or_create_favorites([], status), do: status
  def update_or_create_favorites([head| tail], {_, favorites}) do
    favorite = Repo.get_by(Favorite, favorite_key: head["favorite_key"])

    if (favorite) do
      {update_status, updated_favorite} = update_favorite(favorite, head)
      update_or_create_favorites(tail, {update_status, [updated_favorite | favorites]})
    else
      {create_status, created_favorite} = create_favorite(head)
      update_or_create_favorites(tail, {create_status, [created_favorite | favorites]})
    end
  end

  def update_favorite(favorite, favorite_params) do
    changeset = Favorite.changeset(favorite, favorite_params)
    Repo.update(changeset)
  end

  def create_favorite(favorite_params) do
    changeset = Favorite.changeset(%Favorite{}, favorite_params)
    Repo.insert(changeset)
  end

end
