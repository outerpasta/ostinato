defmodule Ostinato.PageControllerTest do
  use Ostinato.ConnCase, async: true

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Ostinato!"
  end
end
