defmodule Tinkerlog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :slug, :string
      add :title, :string
      add :body, :text
      add :published_at, :date

      timestamps()
    end

    create unique_index(:posts, [:slug])
  end
end
