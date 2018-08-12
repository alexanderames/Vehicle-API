require 'rails_helper'

RSpec.describe Option, type: :model do
  describe '#validations' do
    it 'should have valid factory' do
      expect(build :option).to be_valid
    end
  end
end
