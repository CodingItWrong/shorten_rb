# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link do
  describe '#slug' do
    it 'does not allow duplicates within the same domain' do
      slug = 'myslug'
      domain = 'example.com'
      FactoryBot.create(:link, slug:, domain:)

      expect {
        FactoryBot.create(:link, slug:, domain:)
      }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Slug has already been taken')
    end

    it 'does not allow duplicates for the nil domain' do
      slug = 'myslug'
      FactoryBot.create(:link, slug:)

      expect {
        FactoryBot.create(:link, slug:)
      }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Slug has already been taken')
    end

    it 'allow duplicates across domains' do
      slug = 'myslug'
      FactoryBot.create(:link, slug:, domain: '1.example.com')

      expect {
        FactoryBot.create(:link, slug:, domain: '2.example.com')
      }.not_to raise_error
    end
  end
end
