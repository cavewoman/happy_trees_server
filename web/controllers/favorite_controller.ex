defmodule HappyTreesServer.FavoriteController do
  use HappyTreesServer.Web, :controller

  alias HappyTreesServer.Favorite

  def index(conn, _params) do
    favorites = Repo.all(Favorite)
    render(conn, "index.html", favorites: favorites)
  end

  def new(conn, _params) do
    changeset = Favorite.changeset(%Favorite{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"favorite" => favorite_params}) do
    changeset = Favorite.changeset(%Favorite{}, favorite_params)

    case Repo.insert(changeset) do
      {:ok, _favorite} ->
        conn
        |> put_flash(:info, "Favorite created successfully.")
        |> redirect(to: favorite_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    favorite = Repo.get!(Favorite, id)
    render(conn, "show.html", favorite: favorite)
  end

  def edit(conn, %{"id" => id}) do
    favorite = Repo.get!(Favorite, id)
    changeset = Favorite.changeset(favorite)
    render(conn, "edit.html", favorite: favorite, changeset: changeset)
  end

  def update(conn, %{"id" => id, "favorite" => favorite_params}) do
    favorite = Repo.get!(Favorite, id)
    changeset = Favorite.changeset(favorite, favorite_params)

    case Repo.update(changeset) do
      {:ok, favorite} ->
        conn
        |> put_flash(:info, "Favorite updated successfully.")
        |> redirect(to: favorite_path(conn, :show, favorite))
      {:error, changeset} ->
        render(conn, "edit.html", favorite: favorite, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    favorite = Repo.get!(Favorite, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(favorite)

    conn
    |> put_flash(:info, "Favorite deleted successfully.")
    |> redirect(to: favorite_path(conn, :index))
  end
end
