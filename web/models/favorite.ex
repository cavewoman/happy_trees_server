defmodule HappyTreesServer.Favorite do
  use HappyTreesServer.Web, :model

  @derive {Poison.Encoder, except: [:__meta__] }
  schema "favorites" do
    field :title, :string
    field :url, :string
    field :favorite_key, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :url, :favorite_key])
    |> validate_required([:title, :url, :favorite_key])
  end
end
