require('spec_helper')

describe(Employee) do
  describe('#division') do
    it('tells which division an employee belongs to') do
      test_division = Division.create({:name => 'division'})
      test_employee = Employee.create({:name => 'employee', :division_id => test_division.id})

      expect(test_employee.division()).to eq(test_division)
    end
  end
end
