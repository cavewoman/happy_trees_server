defmodule HappyTreesServer.FavoriteTest do
  use HappyTreesServer.ModelCase

  alias HappyTreesServer.Favorite

  @valid_attrs %{favorite_key: "some content", title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Favorite.changeset(%Favorite{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Favorite.changeset(%Favorite{}, @invalid_attrs)
    refute changeset.valid?
  end
end
