defmodule HappyTreesServer.API.FavoriteControllerTest do
  use HappyTreesServer.ConnCase
  import HappyTreesServer.Factory

  test "GET favorites", %{conn: conn} do
    favorite1 = insert(:favorite)
    favorite2 = insert(:favorite)
    conn = get conn, api_favorite_path(conn, :index, %{})
    response = json_response(conn, 200)

    assert Enum.count(response) == 2
    assert List.first(response)["id"] == favorite1.id
    assert List.last(response)["id"] == favorite2.id
  end

end
