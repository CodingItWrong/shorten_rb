# frozen_string_literal: true

require "rails_helper"

RSpec.describe "links", type: :request do
  context "with a link with no domain" do
    it "redirects to the link and logs the hit" do
      link = FactoryBot.create(:link)

      get "/#{link.slug}"

      expect(response.status).to eq(302)
      expect(response.header["Location"]).to eq(link.destination)

      expect(Hit.count).to eq(1)
      expect(Hit.last.link).to eq(link)
    end
  end

  context "with a link with a matching domain" do
    it "redirects to the link and logs the hit" do
      link = FactoryBot.create(:link, domain: "www.example.com")

      get "/#{link.slug}"

      expect(response.status).to eq(302)
      expect(response.header["Location"]).to eq(link.destination)
    end
  end

  context "with a link with a non-matching domain" do
    it "raises a not found error" do
      link = FactoryBot.create(:link, domain: "other.example.com")

      get "/#{link.slug}"

      expect(response.status).to eq(404)
      expect(response.body).to include("ActiveRecord::RecordNotFound") # in non-production only
    end
  end

  context "with a non-matching slug" do
    it "raises a not found error" do
      get "/invalid-slug"

      expect(response.status).to eq(404)
      expect(response.body).to include("ActiveRecord::RecordNotFound") # in non-production only
    end
  end
end
