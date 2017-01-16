defmodule Ostinato.SuiteController do
  use Ostinato.Web, :controller

  alias Ostinato.Suite

  def index(conn, _params) do
    suites = Repo.all(Suite)
    render(conn, "index.html", suites: suites)
  end

  def new(conn, _params) do
    changeset = Suite.changeset(%Suite{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"suite" => suite_params}) do
    changeset = Suite.changeset(%Suite{}, suite_params)

    case Repo.insert(changeset) do
      {:ok, _suite} ->
        conn
        |> put_flash(:info, "Suite created successfully.")
        |> redirect(to: suite_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    suite = Repo.get!(Suite, id)
    render(conn, "show.html", suite: suite)
  end

  def edit(conn, %{"id" => id}) do
    suite = Repo.get!(Suite, id)
    changeset = Suite.changeset(suite)
    render(conn, "edit.html", suite: suite, changeset: changeset)
  end

  def update(conn, %{"id" => id, "suite" => suite_params}) do
    suite = Repo.get!(Suite, id)
    changeset = Suite.changeset(suite, suite_params)

    case Repo.update(changeset) do
      {:ok, suite} ->
        conn
        |> put_flash(:info, "Suite updated successfully.")
        |> redirect(to: suite_path(conn, :show, suite))
      {:error, changeset} ->
        render(conn, "edit.html", suite: suite, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    suite = Repo.get!(Suite, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(suite)

    conn
    |> put_flash(:info, "Suite deleted successfully.")
    |> redirect(to: suite_path(conn, :index))
  end
end
