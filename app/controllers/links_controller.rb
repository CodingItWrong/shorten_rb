class LinksController < ApplicationController
  # see https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections#temporary_redirections
  TEMPORARY_REDIRECT = 302

  def show
    link = Link.by_slug_and_optional_domain(slug: slug, domain: domain).take!
    log_access(link)
    redirect_to link.destination, status: TEMPORARY_REDIRECT, allow_other_host: true
  end

  private

  def slug
    params[:slug]
  end

  def domain
    request.host
  end

  def log_access(link)
    # TODO: rescue from persistence errors
    Hit.create(link: link)
  end
end
