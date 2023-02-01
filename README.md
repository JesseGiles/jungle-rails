# Jungle

**Jungle** is a mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example during the **Lighthouse Labs Web Development Bootcamp**. The framework and design were largely provided to us, and additional functionality implemented as part of the project, to teach learning an unfamiliar language in an existing application. Additional functionality that was implemented includes: conditionally rendering 'Add to Cart' or 'Sold Out' on products based on stock levels, an admin dashboard where existing products and categories can be viewed and new ones created (with login security), an order summary on checkout, an about page, user signup/login with authentication, and improved navigation bar layout/functionality. Testing was implemented through RSpec and Cypress.

A stretch goal to include email generation for customers upon checkout (showing their order details) was also completed.

## Screenshots

!["Index"](https://github.com/JesseGiles/jungle-rails/blob/master/docs/index.png?raw=true)

!["Products view"](https://github.com/JesseGiles/jungle-rails/blob/master/docs/products.png?raw=true)

!["Checkout"](https://github.com/JesseGiles/jungle-rails/blob/master/docs/checkout.png)

!["Admin New Product"](https://github.com/JesseGiles/jungle-rails/blob/master/docs/admin_new_product.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
