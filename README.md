# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Routes

1. Routes are present in `./config/routes.rb`
2. `get "/posts", controller: "posts", action: "index"` => declares `/posts` route, now declare controller called `posts_controller` which will render view `posts/index.html.erb`.
3. Another way to write route is `get "/posts", to: "posts#index"`

## Active Record Migrations
1. Models can interact with the application's database through a feature of Rails called **Active Record**.
2. Model names are **singular**. However, when we do a migrtaion, Ruby creates a class with plural name `CreatePosts`.
3. Sample command to define model: `bin/rails generate model Article title:string body:text`. Other types of data types in Ruby are: `:primary_key, :string, :text, :integer, :float, :decimal, :datetime, :timestamp, :time, :date, :binary, :boolean, :references`.
4. Main files we are concerned with: `db/migrate/<timestamp>_create_posts.rb` and `models/post.rb`.
5. Migrations are used to alter the structure of an application's database.
6. Now we run the command: `rails db:migrate`. After this command, it also updates the `db/schema.rb` file. Don't modify this file directly. Always create a new migration so that you can always rollback.
7. Ruby uses **DSL (Domain Specific Language)** so that we dont have to write SQL ourselves.
8. Perform migration by adding a column: `rails generate migration add_topic_to_posts topic:string`. Notice that we added `posts` instead of `post` here.
9. Use `db:rollback` to revert.
10. Use `resources` instead of GET, POST etc in `routes.rb`.
11. Turbo Frames allow predefined parts of a page to be updated on request. Any links and forms inside a frame are captured, and the frame contents automatically updated after receiving a response.
12. A concern is only responsible for a focused subset of the model's responsibility; the methods in our concern will all be related to the visibility of a model.

## GraphQL Integration
1. `bundle add graphql`
2. While we use queries to fetch data, we use mutations to modify server-side data.