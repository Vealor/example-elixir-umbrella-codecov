defmodule Example.Web.PageController do
  use Example.Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
