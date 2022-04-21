defmodule MarketplaceWeb.MainLive do
  use MarketplaceWeb, :live_view

  alias MarketplaceWeb.Main.Items
  alias Marketplace.Products.Repositories.ProductRepository
  alias Marketplace.Products.Entities.Product

  @impl true
  def mount(_assigns, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(_params, _url, socket) do
    products = ProductRepository.list()

    socket =
      socket
      |> assign(products: products)
      |> assign(name: "")
      |> assign(is_selected: false)

    {:noreply, socket}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    {:ok, _} = ProductRepository.delete_product(id)

    {:noreply, assign(socket, :products, ProductRepository.list())}
  end

  @impl true
  def handle_event("filter-by-name", %{"name" => name}, socket) do
    socket = apply_filters(socket, name)
    {:noreply, socket}
  end

  @impl true
  def handle_event("filter_by_active", %{"value" => value}, socket) do
    case is_checked?(value) do
      true ->
        {:noreply, assign(socket, :products, ProductRepository.list("active", :status))}

      false ->
        nil
    end
  end

  @impl true
  def handle_event("filter_by_stub", %{"value" => value}, socket) do
    case is_checked?(value) do
      true ->
        {:noreply, assign(socket, :products, ProductRepository.list("stub", :status))}

      false ->
        nil
    end
  end

  def handle_event("filter_by_active", %{}, socket) do
    {:noreply, assign(socket, :products, ProductRepository.list())}
  end

  def handle_event("filter_by_stub", %{}, socket) do
    {:noreply, assign(socket, :products, ProductRepository.list())}
  end

  defp is_checked?(value), do: value == "on"

  def apply_filters(socket, name) do
    products = ProductRepository.list(name)
    assign(socket, products: products, name: name)
  end
end
