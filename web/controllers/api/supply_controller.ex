defmodule HappyTreesServer.API.SupplyController do
  use HappyTreesServer.Web, :controller

  alias HappyTreesServer.Supply

  def index(conn, _params) do
    supplies = Repo.all(Supply)
    json conn, supplies
  end
  
end
