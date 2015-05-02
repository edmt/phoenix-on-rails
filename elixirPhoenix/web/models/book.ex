defmodule ElixirPhoenix.Book do
  use ElixirPhoenix.Web, :model

  @primary_key false
  schema "books" do
    field :book_id,     :integer
    field :description, :string
    field :title,       :string
    field :author,      :string

    timestamps
  end

  @required_fields ~w(description title author)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
