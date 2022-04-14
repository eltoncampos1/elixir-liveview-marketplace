defmodule Marketplace.Products.Repositories.ProductRepository do
  alias Marketplace.Products.Entities.Product
  alias Marketplace.Repo

  def create(params \\ %{}) do
    %Product{}
    |> Product.changeset(params)
    |> Repo.insert()
  end

  def change_product, do: Product.changeset()

  def list, do: Repo.all(Product)
end
