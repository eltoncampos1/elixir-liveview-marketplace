defmodule Marketplace.Repo.Migrations.ChangeCategoryType do
  use Ecto.Migration

  def change do
    alter table(:products) do
      remove :category, :string
      add :category, :category_type
    end
  end
end
