defmodule MarketplaceWeb.Main.Items do
  use MarketplaceWeb, :live_component
  alias MarketplaceWeb.Main.{FilterByName, FilterByStatus, Item}
  alias Marketplace.Products.Repositories.ProductRepository

  @impl true
  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(products: assigns.products)
     |> assign(name: "")
     |> assign(is_selected: false)}
  end
end
