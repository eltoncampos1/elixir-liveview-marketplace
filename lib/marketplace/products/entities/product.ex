defmodule Marketplace.Products.Entities.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:title, :description, :status, :price]
  @optional_params [:category, :promotional_price]

  @status_values [:active, :stub]

  schema "products" do
    field :title, :string
    field :description, :string
    field :status, Ecto.Enum, values: @status_values
    field :category, :string
    field :price, Money.Ecto.Amount.Type
    field :promotional_price, Money.Ecto.Amount.Type

    timestamps()
  end

  def changeset(attrs \\ %{}) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @required_params ++ @optional_params)
    |> validate_required(@required_params)
    |> unique_constraint([:title])
  end
end
