defmodule HappyTreesServer.SupplyTest do
  use HappyTreesServer.ModelCase

  alias HappyTreesServer.Supply

  @valid_attrs %{amount: "120.5", name: "some content", supply_key: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Supply.changeset(%Supply{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Supply.changeset(%Supply{}, @invalid_attrs)
    refute changeset.valid?
  end
end
