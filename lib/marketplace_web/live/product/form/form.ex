defmodule MarketplaceWeb.ProductLive.Form do
  use MarketplaceWeb, :live_component
  alias Marketplace.Products.{Entities.Product, Repositories.ProductRepository}

  @upload_config [accept: ~w/.png .jpg .jpeg/, max_entries: 3, max_file_size: 10_000_000]

  @impl true
  def update(%{product: product, action: action} = assigns, socket) do
    changeset = ProductRepository.change_product(product)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(changeset: changeset)
     |> assign(action: action)
     |> allow_upload(:photo, @upload_config)
     |> assign(product: product)}
  end

  @impl true
  def handle_event("validate", %{"product" => product_params}, socket) do
    changeset =
      socket.assigns.product
      |> ProductRepository.change_product(product_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  @impl true
  def handle_event("save", %{"product" => product_params}, socket) do
    action = socket.assigns.action
    save(socket, action, product_params)
  end

  def save(socket, :new, product_params) do
    product_params = build_photo_to_upload(socket, product_params)

    case ProductRepository.create(product_params) do
      {:ok, _product} ->
        {:noreply,
         socket
         |> put_flash(:info, "Product has created!")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def save(socket, :edit, product_params) do
    # product_params = build_photo_to_upload(socket, product_params)

    IO.inspect(product_params)

    case ProductRepository.update_product(socket.assigns.product, product_params) do
      {:ok, _product} ->
        {:noreply,
         socket
         |> put_flash(:info, "Product has updated!")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  @impl true
  def handle_event("cancel", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :photo, ref)}
  end

  defp build_photo_to_upload(socket, product_params) do
    [file_upload | _] =
      consume_uploaded_entries(socket, :photo, fn %{path: path}, entry ->
        file_name = get_file_name(entry)
        dest = Path.join("/tmp", file_name)
        File.cp!(path, dest)

        file_upload = %Plug.Upload{
          content_type: entry.client_type,
          filename: entry.client_name,
          path: dest
        }

        {:ok, file_upload}
      end)

    Map.put(product_params, "product_url", file_upload)
  end

  defp get_file_name(entry) do
    [ext | _] = MIME.extensions(entry.client_type)
    "#{entry.uuid}.#{ext}"
  end
end
