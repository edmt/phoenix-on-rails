defmodule ElixirPhoenix.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books, primary_key: false) do
      add :book_id    , :integer
      add :description, :string
      add :title      , :string
      add :author     , :string

      timestamps
    end
  end
end
