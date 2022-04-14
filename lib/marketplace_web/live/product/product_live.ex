defmodule MarketplaceWeb.ProductLive do
  use MarketplaceWeb, :live_view

  # alias MarketplaceWeb.Main.Items

  def mount(_assigns, _session, socket) do
    {:ok, socket |> assign(name: "elton")}
  end
end
