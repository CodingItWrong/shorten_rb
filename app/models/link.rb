class Link < ApplicationRecord
  has_many :hits

  validates :slug, uniqueness: { scope: :domain }

  # TODO: if there is a nil-domain match and a non-nil-domain match, prefer non-nil
  scope :by_slug_and_optional_domain, ->(slug:, domain:) {
    where(slug: slug)
      .and(
        where(domain: domain)
        .or(where(domain: nil))
      )
  }
end
