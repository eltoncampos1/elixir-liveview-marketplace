defmodule Marketplace.Products.ProductImage do
  use Waffle.Definition
  use Waffle.Ecto.Definition

  @extension_withelist ~w(.png .jpg .jpeg)

  def validate({file, _}) do
    file_extension =
      file.file_name
      |> Path.extname()
      |> String.downcase()

    case Enum.member?(@extension_withelist, file_extension) do
      true -> :ok
      false -> {:error, "Invalid file type."}
    end
  end

  def storage_dir(_, {file, _product}) do
    [filename, _] = String.split(file.file_name, ".")

    "/priv/static/uploads/products/#{filename}"
  end
end
