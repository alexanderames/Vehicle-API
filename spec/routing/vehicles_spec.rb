require 'rails_helper'

describe 'vehicles routes' do
  it 'should route to vehicles index' do
    expect(get '/vehicles').to route_to('vehicles#index')
  end

  it 'should route to vehicles show' do
    expect(get '/vehicles/1').to route_to('vehicles#show', id: '1')
  end

  it 'should route to vehicles create' do
    expect(post '/vehicles').to route_to('vehicles#create')
  end

  it 'should route to vehicles update' do
    expect(put '/vehicles/1').to route_to('vehicles#update', id: '1')
    expect(patch '/vehicles/1').to route_to('vehicles#update', id: '1')
  end

  it 'should route to vehicles destroy' do
    expect(delete '/vehicles/1').to route_to('vehicles#destroy', id: '1')
  end
end
