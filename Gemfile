source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "rails", "~> 6.0.2", ">= 6.0.2.2"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.3"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
# gem 'redis', '~> 4.0'
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "pry", "~> 0.10.3"
  gem "faker", "~> 2.1", ">= 2.1.2"
end

group :development do
  gem "bullet", "~> 6.0", ">= 6.0.1"
  gem "letter_opener", "~> 1.7"
  gem "rubocop", "~> 0.74.0"
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
