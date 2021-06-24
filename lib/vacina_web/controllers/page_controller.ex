defmodule VacinaWeb.PageController do
  use VacinaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
