defmodule HappyTreesServer.Favorite do
  use HappyTreesServer.Web, :model

  @derive {Poison.Encoder, except: [:__meta__] }
  schema "favorites" do
    field :title, :string
    field :url, :string
    field :favorite_key, :string
    field :supply_names, {:array, :string}

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :url, :favorite_key, :supply_names])
    |> validate_required([:title, :url, :favorite_key])
    |> unique_constraint(:favorite_key)
  end
end
