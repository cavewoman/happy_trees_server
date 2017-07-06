defmodule HappyTreesServer.PaintingTest do
  use HappyTreesServer.ModelCase

  alias HappyTreesServer.Painting

  @valid_attrs %{date_painted: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, painting_key: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Painting.changeset(%Painting{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Painting.changeset(%Painting{}, @invalid_attrs)
    refute changeset.valid?
  end
end
