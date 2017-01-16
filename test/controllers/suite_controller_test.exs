defmodule Ostinato.SuiteControllerTest do
  use Ostinato.ConnCase, async: true

  alias Ostinato.User
  alias Ostinato.Suite
  @valid_attrs %{name: "some content", notes: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    user = User.changeset(%User{}, %{name: "test", email: "test@example.com", password: "test", password_confirmation: "test"})
    |> Repo.insert!
    {:ok, conn: assign(conn, :current_user, user), user: user}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, suite_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing suites"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, suite_path(conn, :new)
    assert html_response(conn, 200) =~ "New suite"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, suite_path(conn, :create), suite: @valid_attrs
    assert redirected_to(conn) == suite_path(conn, :index)
    assert Repo.get_by(Suite, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, suite_path(conn, :create), suite: @invalid_attrs
    assert html_response(conn, 200) =~ "New suite"
  end

  test "shows chosen resource", %{conn: conn} do
    suite = Repo.insert! %Suite{}
    conn = get conn, suite_path(conn, :show, suite)
    assert html_response(conn, 200) =~ "Show suite"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, suite_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    suite = Repo.insert! %Suite{}
    conn = get conn, suite_path(conn, :edit, suite)
    assert html_response(conn, 200) =~ "Edit suite"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    suite = Repo.insert! %Suite{}
    conn = put conn, suite_path(conn, :update, suite), suite: @valid_attrs
    assert redirected_to(conn) == suite_path(conn, :show, suite)
    assert Repo.get_by(Suite, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    suite = Repo.insert! %Suite{}
    conn = put conn, suite_path(conn, :update, suite), suite: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit suite"
  end

  test "deletes chosen resource", %{conn: conn} do
    suite = Repo.insert! %Suite{}
    conn = delete conn, suite_path(conn, :delete, suite)
    assert redirected_to(conn) == suite_path(conn, :index)
    refute Repo.get(Suite, suite.id)
  end
end
