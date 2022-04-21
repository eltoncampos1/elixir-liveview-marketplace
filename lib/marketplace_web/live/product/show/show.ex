defmodule MarketplaceWeb.ProductLive.Show do
  use MarketplaceWeb, :live_view
  alias Marketplace.Products.Repositories.ProductRepository

  def mount(assigns, _session, socket) do
    {:ok, socket |> assign(assigns)}
  end

  def handle_params(%{"id" => id}, _url, socket) do
    product = ProductRepository.get_by_id!(id)

    {:noreply,
     socket
     |> assign(product: product)}
  end
end
