module EmployeesHelper

def checked(area)
  @employee.encargado.nil? ? false : @employee.encargado.match(area)
end


end


