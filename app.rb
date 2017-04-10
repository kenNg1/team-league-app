require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/division')
require('./lib/employee')
also_reload('lib/**/*.rb')
require("pg")
require("pry")

get("/") do
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

  delete('/divisions') do
    division = Division.find(params.fetch('id').to_i)
    division.delete
    redirect("/")
  end

  patch('/divisions') do
    division = Division.find(params.fetch('id').to_i)
    name = params.fetch('name')
    division.update({:name => name})
    redirect('/')
  end

post('/divisions') do
  name = params.fetch('name')
  new_division = Division.create(:name => name)
  redirect('/')
end

post('/employees') do
  division_id = params.fetch('division_id')
  name = params.fetch('name')
  new_employee = Employee.create(:name => name, :division_id => division_id)
  # new_url = '/divisions/' + division_id --> Alternative method
  # redirect new_url --> alternative method
  redirect ("/divisions/#{division_id}")
end

get("/divisions/:id") do
  @division = Division.find(params.fetch('id').to_i)
  erb(:division)
end
