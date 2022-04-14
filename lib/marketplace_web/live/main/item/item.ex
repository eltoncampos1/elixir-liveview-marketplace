defmodule MarketplaceWeb.Main.Item do
  use MarketplaceWeb, :live_component

  def update(%{product: product}, socket) do
    {:ok, assign(socket, product: product)}
  end
end
