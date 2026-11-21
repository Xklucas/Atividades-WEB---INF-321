defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HelloWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", HelloWeb do
    pipe_through :browser

    get "/", HelloController, :index
    get "/saudacao/:lang/:name", HelloController, :saudacao
  end
end
