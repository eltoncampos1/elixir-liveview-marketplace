defmodule MarketplaceWeb.ProductLive.Form do
  use MarketplaceWeb, :live_component
  alias Marketplace.Products.Repositories.ProductRepository

  def update(assigns, socket) do
    changeset = ProductRepository.change_product()

    {:ok,
     socket
     |> assign(assigns)
     |> assign(changeset: changeset)}
  end

  def handle_event("validate", params, socket) do
    IO.inspect(params)
    {:norelpy, socket}
  end
end
