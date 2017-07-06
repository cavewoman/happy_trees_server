defmodule HappyTreesServer.Router do
  use HappyTreesServer.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HappyTreesServer do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/favorites", FavoriteController
    resources "/supplies", SupplyController
    resources "/paintings", PaintingController
  end

  # Other scopes may use custom stacks.
  scope "/api", HappyTreesServer do
    pipe_through :api

    get "/supplies", API.SupplyController, :index, as: :api_supply
    post "/sync_supplies", API.SupplyController, :update, as: :api_supply

    get "/favorites", API.FavoriteController, :index, as: :api_favorite
    post "/sync_favorites", API.FavoriteController, :update, as: :api_favorite

    get "/paintings", API.PaintingController, :index, as: :api_painting
    post "/sync_paintings", API.PaintingController, :update, as: :api_painting

  end
end
