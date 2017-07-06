defmodule HappyTreesServer.API.PaintingControllerTest do
  use HappyTreesServer.ConnCase
  import HappyTreesServer.Factory

  test "GET paintings", %{conn: conn} do
    painting1 = insert(:painting)
    painting2 = insert(:painting)
    conn = get conn, api_painting_path(conn, :index, %{})
    response = json_response(conn, 200)

    assert Enum.count(response) == 2
    assert List.first(response)["id"] == painting1.id
    assert List.last(response)["id"] == painting2.id
  end

end
