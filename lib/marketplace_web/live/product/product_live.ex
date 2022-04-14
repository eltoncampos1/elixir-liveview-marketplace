defmodule MarketplaceWeb.ProductLive do
  use MarketplaceWeb, :live_view

  alias MarketplaceWeb.ProductLive.Form

  def mount(_assigns, _session, socket) do
    {:ok, socket |> assign(name: "elton")}
  end
end
