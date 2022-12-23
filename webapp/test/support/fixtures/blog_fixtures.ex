defmodule Tinkerlog.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tinkerlog.Blog` context.
  """

  @doc """
  Generate a unique post slug.
  """
  def unique_post_slug, do: "some slug#{System.unique_integer([:positive])}"

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        published_at: ~D[2022-12-22],
        slug: unique_post_slug(),
        title: "some title"
      })
      |> Tinkerlog.Blog.create_post()

    post
  end
end
