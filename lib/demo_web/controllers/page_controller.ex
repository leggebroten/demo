defmodule DemoWeb.PageController do
  use DemoWeb, :controller

  alias MyModule

  def index(conn, _params) do
    MyModule.go()
  rescue
    e -> show_what_exception_should_look_like_when_caught_by_plug(conn, e)
  end

  defp show_what_exception_should_look_like_when_caught_by_plug(conn, exception) do
    conn
    |> put_resp_header("content-type", "application/json; charset=utf-8")
    |> send_resp(200, TrippingException.toJSON(exception))
  end

end
