defmodule ElixirPhoenix.BookControllerTest do
  use ElixirPhoenix.ConnCase

  alias ElixirPhoenix.Book
  @valid_params book: %{author: "some content", description: "some content", title: "some content"}
  @invalid_params book: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /books", %{conn: conn} do
    conn = get conn, book_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing books"
  end

  test "GET /books/new", %{conn: conn} do
    conn = get conn, book_path(conn, :new)
    assert html_response(conn, 200) =~ "New book"
  end

  test "POST /books with valid data", %{conn: conn} do
    conn = post conn, book_path(conn, :create), @valid_params
    assert redirected_to(conn) == book_path(conn, :index)
  end

  test "POST /books with invalid data", %{conn: conn} do
    conn = post conn, book_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New book"
  end

  test "GET /books/:id", %{conn: conn} do
    book = Repo.insert %Book{}
    conn = get conn, book_path(conn, :show, book)
    assert html_response(conn, 200) =~ "Show book"
  end

  test "GET /books/:id/edit", %{conn: conn} do
    book = Repo.insert %Book{}
    conn = get conn, book_path(conn, :edit, book)
    assert html_response(conn, 200) =~ "Edit book"
  end

  test "PUT /books/:id with valid data", %{conn: conn} do
    book = Repo.insert %Book{}
    conn = put conn, book_path(conn, :update, book), @valid_params
    assert redirected_to(conn) == book_path(conn, :index)
  end

  test "PUT /books/:id with invalid data", %{conn: conn} do
    book = Repo.insert %Book{}
    conn = put conn, book_path(conn, :update, book), @invalid_params
    assert html_response(conn, 200) =~ "Edit book"
  end

  test "DELETE /books/:id", %{conn: conn} do
    book = Repo.insert %Book{}
    conn = delete conn, book_path(conn, :delete, book)
    assert redirected_to(conn) == book_path(conn, :index)
    refute Repo.get(Book, book.id)
  end
end
