defmodule Tinkerlog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :published_at, :date
    field :slug, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:slug, :title, :body, :published_at])
    |> validate_required([:slug, :title, :body, :published_at])
    |> unique_constraint(:slug)
  end
end
