defmodule MarketplaceWeb.Main.Items do
  use MarketplaceWeb, :live_component
  alias MarketplaceWeb.Main.Item
  alias Marketplace.Products.Repositories.ProductRepository

  def update(_assigns, socket) do
    products = ProductRepository.list()
    {:ok, assign(socket, products: products)}
  end
end
