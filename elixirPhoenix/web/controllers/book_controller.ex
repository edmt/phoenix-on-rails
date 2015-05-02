defmodule ElixirPhoenix.BookController do
  use ElixirPhoenix.Web, :controller

  alias ElixirPhoenix.Book

  plug :scrub_params, "book" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    books = Repo.all(Book)
    render(conn, "index.html", books: books)
  end

  def new(conn, _params) do
    changeset = Book.changeset(%Book{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"book" => book_params}) do
    changeset = Book.changeset(%Book{}, book_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Book created successfully.")
      |> redirect(to: book_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"book_id" => book_id}) do
    book = Repo.get(Book, book_id)
    render(conn, "show.html", book: book)
  end

  def edit(conn, %{"book_id" => book_id}) do
    book = Repo.get(Book, book_id)
    changeset = Book.changeset(book)
    render(conn, "edit.html", book: book, changeset: changeset)
  end

  def update(conn, %{"book_id" => book_id, "book" => book_params}) do
    book = Repo.get(Book, book_id)
    changeset = Book.changeset(book, book_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Book updated successfully.")
      |> redirect(to: book_path(conn, :index))
    else
      render(conn, "edit.html", book: book, changeset: changeset)
    end
  end

  def delete(conn, %{"book_id" => book_id}) do
    book = Repo.get(Book, book_id)
    Repo.delete(book)

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: book_path(conn, :index))
  end
end
