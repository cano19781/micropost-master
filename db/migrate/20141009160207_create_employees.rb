class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :user
      t.string :foto
      t.string :nombres
      t.string :apellidos
      t.string :ci
      t.string :cargo
      t.string :telefono
      t.string :ext
      t.string :celular
      t.string :correo
      t.string :sucursal
      t.string :departamento

      t.timestamps
    end
  end
end
