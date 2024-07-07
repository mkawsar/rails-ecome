# Use an official Ruby runtime as a parent image
FROM ruby:3.3.0

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install gems
COPY Gemfile ./
RUN gem install bundler
RUN bundle install
RUN bundler install

# Copy the application code
COPY . .

# Expose ports
EXPOSE 3000

# Set the entrypoint command
CMD ["rails", "server", "-b", "0.0.0.0"]