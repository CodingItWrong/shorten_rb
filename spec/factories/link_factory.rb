# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    slug { "myslug" }
    domain { nil }
    destination { "https://destination.codingitwrong.com/path" }
  end
end
