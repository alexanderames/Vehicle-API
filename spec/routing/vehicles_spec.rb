require 'rails_helper'

describe 'vehicles routes' do
  it 'should route to vehicles index' do
    expect(get '/vehicles').to route_to('vehicles#index')
  end

  it 'should route to vehicles show' do
    expect(get '/vehicles/1').to route_to('vehicles#show', id: '1')
  end
end
