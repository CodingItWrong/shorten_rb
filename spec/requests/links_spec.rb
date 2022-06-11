# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'links', type: :request do
  it 'redirects to the link and logs the hit' do
    slug = 'mylinkslug'

    expect {
      get "/#{slug}"
    }.to change { Hit.count }.by(1)

    expect(response.status).to eq(302)
  end
end
