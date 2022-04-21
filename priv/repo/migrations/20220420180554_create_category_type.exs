defmodule Marketplace.Repo.Migrations.CreateCategoryType do
  use Ecto.Migration

  def change do
    up_query =
      "CREATE TYPE category_type AS ENUM ('blusas', 'camisetas', 'regatas', 'jaquetas', 'agasalhos', 'calças', 'jeans', 'moletom', 'bermudas', 'shorts')"

    down_query = "DROP TYPE category_type"

    execute(up_query, down_query)
  end
end
