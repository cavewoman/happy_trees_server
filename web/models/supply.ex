defmodule HappyTreesServer.Supply do
  use HappyTreesServer.Web, :model

  @derive {Poison.Encoder, except: [:__meta__] }
  schema "supplies" do
    field :name, :string
    field :type, :string
    field :amount, :float
    field :supply_key, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :type, :amount, :supply_key])
    |> validate_required([:name, :type, :amount, :supply_key])
    |> unique_constraint(:supply_key)
  end
end
