source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "pg", "~> 1.4"
gem "puma", "~> 6.0"
gem "rails", "~> 7.0.4"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails"
  gem "standard"
end

group :test do
  gem "factory_bot_rails"
  gem "rspec_junit_formatter"
end
