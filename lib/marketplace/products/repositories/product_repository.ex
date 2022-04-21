defmodule Marketplace.Products.Repositories.ProductRepository do
  alias Marketplace.Products.Entities.Product
  alias Marketplace.Products.ProductImage
  alias Marketplace.Repo

  import Ecto.Query

  def update_product(product, params) do
    product
    |> Product.changeset(params)
    |> Repo.update()
  end

  def create(params \\ %{}) do
    %Product{}
    |> Product.changeset(params)
    |> Repo.insert()
  end

  def delete_product(id) do
    id
    |> get_by_id!()
    |> Repo.delete()
  end

  def change_product(product, params \\ %{}), do: Product.changeset(product, params)
  def get_by_id!(id), do: Repo.get!(Product, id)

  def list, do: Repo.all(Product)

  def list(title, :asc) do
    title = "%" <> title <> "%"

    Product
    |> where([p], ilike(p.title, ^title))
    |> order_by(asc: :inserted_at)
    |> Repo.all()
  end

  def list(status, :status) do
    Product
    |> where([p], p.status == ^status)
    |> Repo.all()
  end

  def list(title, :desc) do
    title = "%" <> title <> "%"

    Product
    |> where([p], ilike(p.title, ^title))
    |> order_by(desc: :inserted_at)
    |> Repo.all()
  end

  def list(title) do
    title = "%" <> title <> "%"

    Product
    |> where([p], ilike(p.title, ^title))
    |> Repo.all()
  end

  def list(title) do
    title = "%" <> title <> "%"

    Product
    |> where([p], ilike(p.title, ^title))
    |> Repo.all()
  end

  def get_image(product) do
    url = ProductImage.url({product.product_url, product})
    [_, url] = String.split(url, "/priv/static")
    url
  end
end
