require 'rails_helper'

describe 'vehicles routes' do
  it 'should route to vehicles index' do
    expect(get '/vehicles').to route_to('vehicles#index')
  end
end
