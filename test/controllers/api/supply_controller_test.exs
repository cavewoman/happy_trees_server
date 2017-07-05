defmodule HappyTreesServer.API.SupplyControllerTest do
  use HappyTreesServer.ConnCase
  import HappyTreesServer.Factory

  alias HappyTreesServer.Supply

  test "GET supplies", %{conn: conn} do
    supply1 = insert(:supply)
    supply2 = insert(:supply)
    conn = get conn, api_supply_path(conn, :index, %{})
    response = json_response(conn, 200)

    assert Enum.count(response) == 2
    assert List.first(response)["id"] == supply1.id
    assert List.last(response)["id"] == supply2.id
  end

end
