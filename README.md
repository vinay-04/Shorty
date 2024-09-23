# Shorty

Shorty is a URL shortening service that allows you to create short, easy-to-share links.

## Getting Started

Follow these instructions to get the application up and running on your local machine for development and testing purposes.

### Prerequisites

- Ruby version: 2.7.2
- Rails version: 6.1.3

### Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/yourusername/shorty.git
   cd shorty
   ```

2. Install the required gems:

   ```sh
   bundle install
   ```

3. Set up the database:
   ```sh
   rails db:create
   rails db:migrate
   rails db:seed
   ```

### Running the Application

Start the Rails server:

```sh
rails server
```

### Running Tests

Run the test suite:

```sh
bundle exec rspec
```

### Deployment

Instructions for deploying the application will vary depending on your hosting provider. Common steps include:

1. Push your code to the remote repository.
2. Run database migrations on the server:
   ```sh
   rails db:migrate
   ```
