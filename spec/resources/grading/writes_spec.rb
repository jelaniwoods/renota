require 'rails_helper'

RSpec.describe GradingResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'gradings',
          attributes: { }
        }
      }
    end

    let(:instance) do
      GradingResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Grading.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:grading) { create(:grading) }

    let(:payload) do
      {
        data: {
          id: grading.id.to_s,
          type: 'gradings',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      GradingResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { grading.reload.updated_at }
      # .and change { grading.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:grading) { create(:grading) }

    let(:instance) do
      GradingResource.find(id: grading.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Grading.count }.by(-1)
    end
  end
end