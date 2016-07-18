require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/employee")
require("./lib/division")
require("pg")

get("/") do
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

get('/employees') do
  @employees = Employee.all()
  erb(:employees)
end

get('/divisions') do
  @divisions = Division.all()
  erb(:divisions)
end

get('/employees/new') do
  erb(:employee_form)
end

get('/divisions/new') do
  erb(:division_form)
end

post('/employees') do
  @divisions = Division.all()
  name = params.fetch('name')
  @division = Division.new({:name => name})
  @division.save()
end

post('/divisions') do
  @divisions = Division.all()
  name = params.fetch('name')
  @division = Division.new({:name => name})
  @division.save()
  @employees = Employee.all()
  name = params.fetch('name')
  @employee = Employee.new({:name => name})
  @employee.save()
end

get('/employees/:id') do
  @employee = Employee.find(params.fetch('id').to_i())
  erb(:employee)
end

get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch('id').to_i())
  erb(:employee_edit)
end

patch('/employees/:id') do
  name = params.fetch('division_id')
  @employee = Employee.find(params.fetch('id').to_i())
  @employee.update({:name => name})
  @employees = Employee.all()
  erb(:employees)
end
