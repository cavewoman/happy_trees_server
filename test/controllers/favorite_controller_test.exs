defmodule HappyTreesServer.FavoriteControllerTest do
  use HappyTreesServer.ConnCase

  alias HappyTreesServer.Favorite
  @valid_attrs %{favorite_key: "some content", title: "some content", url: "some content"}
  @valid_create_attrs %{title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, favorite_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing favorites"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, favorite_path(conn, :new)
    assert html_response(conn, 200) =~ "New favorite"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, favorite_path(conn, :create), favorite: @valid_create_attrs
    assert redirected_to(conn) == favorite_path(conn, :index)
    assert Repo.get_by(Favorite, @valid_create_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, favorite_path(conn, :create), favorite: @invalid_attrs
    assert html_response(conn, 200) =~ "New favorite"
  end

  test "shows chosen resource", %{conn: conn} do
    favorite = Repo.insert! %Favorite{}
    conn = get conn, favorite_path(conn, :show, favorite)
    assert html_response(conn, 200) =~ "Show favorite"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, favorite_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    favorite = Repo.insert! %Favorite{}
    conn = get conn, favorite_path(conn, :edit, favorite)
    assert html_response(conn, 200) =~ "Edit favorite"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    favorite = Repo.insert! %Favorite{}
    conn = put conn, favorite_path(conn, :update, favorite), favorite: @valid_attrs
    assert redirected_to(conn) == favorite_path(conn, :show, favorite)
    assert Repo.get_by(Favorite, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    favorite = Repo.insert! %Favorite{}
    conn = put conn, favorite_path(conn, :update, favorite), favorite: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit favorite"
  end

  test "deletes chosen resource", %{conn: conn} do
    favorite = Repo.insert! %Favorite{}
    conn = delete conn, favorite_path(conn, :delete, favorite)
    assert redirected_to(conn) == favorite_path(conn, :index)
    refute Repo.get(Favorite, favorite.id)
  end
end
