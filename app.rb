require 'sinatra'
require 'sequel'

DB = Sequel.connect('sqlite://test.db') # memory database

get '/trill' do
  redirect 'dank.html'
end


get '/create_table' do
  DB.create_table :posts do
    primary_key :id
    String :uname
    String :comment
    end
end


post '/form' do
  @items = DB[:posts]
  @user = params['user']
  @comment = params['comment']
  @items.insert(:uname => @user, :comment => @comment)
  erb :swag



  #do your database insert
  #then do your database extraction and make a data object like @data
  #call the erb :swag again and @ data will be available in there to parse and display below your form
end

