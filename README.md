# shorten_rb

A simple Rails link shortener that respects privacy. Easy to self-host on Heroku.

## Requirements

- Ruby
- Postgres

## Installation

`bin/setup`

## Running

`rails s`

## Usage

Redirects are configured with the `Link` model. A `Link` has the following attributes:

- `slug`, the segment in the URL. When running locally this will be at `http://localhost:3000/[slug]`, and in production it will be the path under your deployed server
- `destination`, the full URL to redirect to
- An optional `domain`, which limits the slug matching to a single domain. This allows you to point multiple domains to the same deployed instance, and have the same slug on different domains go to different destinations

There is no user interface for configuring `Link`s; use the Rails console.

Redirects are always sent as `302 Found`. This ensures they aren't permanently cached, so you can change the redirect later.

Accesses are logged as a `Hit` model. No information about the request is logged except for the time the request was made.

## Helpful Queries

Number of hits per link:

```ruby
Link.select('links.id, domain, slug, COUNT(hits.id) AS hit_count').joins(:hits).group('links.id').order('hit_count DESC').map { |l| "#{l.domain}/#{l.slug} -- #{l.hits.count} hits" }
```

## License

MIT
