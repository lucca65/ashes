# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ashes.Repo.insert!(%Ashes.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Ashes.Repo.delete_all(Ashes.AdminUser)

Ashes.AdminUser.changeset(%Ashes.AdminUser{}, %{name: "Admin", email: "admin@example.com", password: "password", password_confirmation: "password"})
|> Ashes.Repo.insert!

