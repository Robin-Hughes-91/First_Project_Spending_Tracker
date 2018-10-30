require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag.rb' )
require ('pry')
also_reload( '../models/*' )


get '/tags' do
  @tag = Tag.all()
  erb ( :"tags/index" )
end

get '/tags/new' do
  erb(:"tags/new")
end

get '/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  erb(:"tags/show")
end

post '/tags/:id/delete' do
  Tag.destroy(params[:id])
  redirect to("/tags")
end

post '/tags' do
  @tag = Tag.new(params)
  @tag.save
  redirect to("/tags")
end

get '/tags/:id/update' do
  @tag = Tag.find( params[:id] )
  erb( :"tags/update" )
end

post '/tags/:id' do
  Tag.new(params).update
  redirect to("/tags")
end
