# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ostinato.Repo.insert!(%Ostinato.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Ostinato.Repo.delete_all Ostinato.User

Ostinato.User.changeset(%Ostinato.User{}, %{name: "admin", email: "admin@example.com", password: "admin", password_confirmation: "admin"})
|> Ostinato.Repo.insert!
|> Coherence.ControllerHelpers.confirm!
