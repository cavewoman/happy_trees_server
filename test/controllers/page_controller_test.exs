defmodule HappyTreesServer.PageControllerTest do
  use HappyTreesServer.ConnCase, async: true

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Happy Trees!"
  end
end
