defmodule MarketplaceWeb.ProductLive do
  use MarketplaceWeb, :live_view

  alias MarketplaceWeb.ProductLive.Form
  alias Marketplace.Products.Entities.Product
  alias Marketplace.Products.Repositories.ProductRepository

  def mount(assigns, _session, socket) do
    {:ok, socket |> assign(assigns)}
  end

  def handle_params(params, _url, socket) do
    live_action = socket.assigns.live_action
    {:noreply, apply_action(socket, live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Criar novo produto")
    |> assign(:product, %Product{})
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    product = ProductRepository.get_by_id!(id)

    socket
    |> assign(:page_title, "Editar produto")
    |> assign(:form_action, :edit)
    |> assign(:product, product)
  end
end
