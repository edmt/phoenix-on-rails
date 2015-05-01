defmodule Phoenix.Book do
  use Ecto.Model

  @primary_key false
  schema "books" do
    field :book_id       :integer
    field :title,        :string
    field :description,  :string
    field :author,       :string
  end
end
