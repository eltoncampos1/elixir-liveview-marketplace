defmodule MarketplaceWeb.MainLive do
  use MarketplaceWeb, :live_view

  alias MarketplaceWeb.Main.Items
  alias Marketplace.Products.Repositories.ProductRepository

  def mount(_assigns, _session, socket) do
    products = ProductRepository.list()
    {:ok, socket |> assign(products: products)}
  end
end
