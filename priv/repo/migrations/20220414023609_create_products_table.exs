defmodule Marketplace.Repo.Migrations.CreateProductsTable do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :description, :text
      add :status, :status_type
      add :category, :string
      add :price, :integer
      add :promotional_price, :integer

      timestamps()
    end

    create unique_index(:products, [:title])
  end
end
