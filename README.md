# Marketplace

To start your Phoenix server:
  * start postgres server with `docker-compose up -d`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

 - [`localhost:4000/`](http://localhost:4000)
    - list your products

- [`localhost:4000/products/new`](http://localhost:4000/products/new)
    - you can create a new product like this 
      ```ssh
        title: String,
        description: HTML,
        category: ENUM,
        price: MoneyType,
        promotional_price: MoneyType,
        status: ENUM(stub, active)
        product_url: string,
      ```
  - [`localhost:4000/products/:id/edit`](http://localhost:4000/products/new)
      - you can edit an product

  - [`localhost:4000/products/:id`](http://localhost:4000/products/new)
      - you can show an product