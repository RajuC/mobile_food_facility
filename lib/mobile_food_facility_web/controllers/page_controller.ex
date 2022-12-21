defmodule MobileFoodFacilityWeb.PageController do
  use MobileFoodFacilityWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
