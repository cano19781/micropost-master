class Employee < ActiveRecord::Base
  attr_accessible :apellidos, :cargo, :encargado, :celular, :ci, :correo, :departamento, :ext, :foto, :nombres, :sucursal, :telefono, :user
  attr_accessible :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/default.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/







def self.search(search)

 if search 

    where(["nombres ILIKE ? OR encargado ILIKE ? OR apellidos ILIKE ? OR sucursal ILIKE ? OR departamento ILIKE ? OR encargado ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])

  

  else

    scoped

  end

end
end




