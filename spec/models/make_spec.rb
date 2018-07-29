require 'rails_helper'

RSpec.describe Make, type: :model do
  describe '#validations' do
    it 'should have valid factory' do
      expect(build :make).to be_valid
    end

    it 'should test presence of attributes' do
      make = Make.new
      expect(make).not_to be_valid
      expect(make.errors.messages).to include({
        user: ['must exist'],
        vehicle: ['must exist'],
        name: ["can't be blank"]
        })
    end
  end
end
