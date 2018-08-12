require 'rails_helper'

RSpec.describe Model, type: :model do
  describe '#validations' do
    it 'should have valid factory' do
      expect(build :model).to be_valid
    end
  end
end
