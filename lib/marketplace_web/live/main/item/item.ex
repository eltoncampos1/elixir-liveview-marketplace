defmodule MarketplaceWeb.Main.Item do
  use MarketplaceWeb, :live_component

  alias Marketplace.Products.Repositories.ProductRepository

  def update(%{product: product}, socket) do
    product = change_status(product)

    {:ok,
     socket
     |> assign(product: product)
     |> assign(description: product.description)}
  end

  defp change_status(%{status: :active} = product), do: %{product | status: "Ativo"}
  defp change_status(%{status: :stub} = product), do: %{product | status: "Rascunho"}
end
