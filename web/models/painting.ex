defmodule HappyTreesServer.Painting do
  use HappyTreesServer.Web, :model

  @derive {Poison.Encoder, except: [:__meta__] }
  schema "paintings" do
    field :title, :string
    field :date_painted, Ecto.DateTime
    field :painting_key, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :date_painted, :painting_key])
    |> validate_required([:title, :date_painted, :painting_key])
    |> unique_constraint(:painting_key)
  end
end
