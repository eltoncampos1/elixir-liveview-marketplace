defmodule Marketplace.Products.Entities.Product do
  use Ecto.Schema
  import Ecto.Changeset
  import Waffle.Ecto.Schema

  alias Marketplace.Products.ProductImage

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:title, :description, :status, :price]
  @optional_params [:category, :promotional_price]

  @status_values [:active, :stub]
  @category_values [
    :blusas,
    :camisetas,
    :regatas,
    :jaquetas,
    :agasalhos,
    :calças,
    :jeans,
    :moletom,
    :bermudas,
    :shorts
  ]

  schema "products" do
    field :title, :string
    field :description, :string
    field :status, Ecto.Enum, values: @status_values
    field :category, Ecto.Enum, values: @category_values
    field :price, Money.Ecto.Amount.Type
    field :promotional_price, Money.Ecto.Amount.Type
    field :product_url, ProductImage.Type
    timestamps()
  end

  def changeset(attrs \\ %{}) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @required_params ++ @optional_params)
    |> cast_attachments(params, [:product_url])
    |> validate_required(@required_params)
    |> unique_constraint([:title])
  end
end
