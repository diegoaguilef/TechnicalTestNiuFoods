# README
This is Test project for NiuFoods. The project is a simple API to manage devices and updates for a restaurant. 
The project has a simple admin panel to manage devices and updates, and a simulator script to send device information to the API.
The admin panel has the following features:
- List, create, update and delete all available resources (Devices, Categories, Restaurants, cities, communes)
- Dashboard with a list of restaurants and their status that refreshes every 15 seconds, permitting to see the status of the restaurants in real-time
- A simple login system with a role-based system (admin, user)
- A simple API to manage devices and updates
## Requirements

* Ruby version: 3.2.2
* Rails Version 7.0.8
* System dependencies: redis, postgresql

## Configuration

* Database creation
    
    ```
    rails db:create
    ```

* Database initialization
    ```
    rails db:migrate db:seed
    ```

* Enviroment variables

    ```
    cp .env.example .env
    ```

    ```
    # .env
    REDIS_URL=redis://{host}:{port}/{db}
    RAILS_MASTER_KEY={master_key}
    ```
## How to run development environment
- Install Ruby dependencies
    ```
    bundle install
    ```
- Run redis server (as you have installed it)

    ```
    redis-server
    ```
- Run sidekiq for background jobs
    ```
    bundle exec sidekiq
    ```
- Run the Rails server
    ```
    rails s
    ```

## How to run simulator script
- Run the script located in the root of the project
    ```
    ruby simulator.rb
    ```
- The script will ask for the email and password of the user to login
- The script will send device information to the API every 5 seconds with the following format
    ```
    device = {
      "id" => 23,
      "name" => "Ricoh 2",
      "version" => 1.0,
      "status" => "error",
      "category_id" => 2,
      "restaurant_id" => 3,
      "updates_attributes" => [
        {
          "name" => "Revision 1",
          "version" => 1.0,
          "status" => 'active',
          "details" => 'edf9iehubgtijw3efngberynigowefw'
        },
        ...
      ]
  }
  ```
- on each request, the script will update the device status and create a new update for the device
## Admin credentials
- To access the admin panel or login into app with the simulator script, you can
use the existing user or create a new one and set the role to admin in the seed file

    ```
    # db/seeds.rb
    User.create(email: 'test@user.cl', password: '123456', role: 'admin')
    ```
  
Then Reinitialize the database
    ```
    rails db:drop db:create db:migrate db:seed
    ```