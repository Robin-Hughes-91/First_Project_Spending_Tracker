require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant.rb' )
require ('pry')
also_reload( '../models/*' )


get '/merchants' do
  @merchant = Merchant.all()
  erb ( :"merchants/index" )
end

get '/merchants/new' do
  erb(:"merchants/new")
end

get '/merchants/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  erb(:"merchants/show")
end

post '/merchants/:id/delete' do
  Merchant.destroy(params[:id])
  redirect to("/merchants")
end

post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save
  redirect to("/merchants")
end

get '/merchants/:id/update' do
  @merchant = Merchant.find( params[:id] )
  erb( :"merchants/update" )
end

post '/merchants/:id' do
  Merchant.new(params).update
  redirect to("/merchants")
end
