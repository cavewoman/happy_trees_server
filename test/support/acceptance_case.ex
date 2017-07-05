defmodule HappyTreesServer.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias HappyTreesServer.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import HappyTreesServer.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(HappyTreesServer.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(HappyTreesServer.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(HappyTreesServer.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
