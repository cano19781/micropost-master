class AddEncargadoToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :encargado, :string
  end
end
