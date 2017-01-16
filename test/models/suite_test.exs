defmodule Ostinato.SuiteTest do
  use Ostinato.ModelCase, async: true

  alias Ostinato.Suite

  @valid_attrs %{name: "some content", notes: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Suite.changeset(%Suite{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Suite.changeset(%Suite{}, @invalid_attrs)
    refute changeset.valid?
  end
end
