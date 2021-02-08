ActiveAdmin.register Cab do
  permit_params :city_id

  index do
    selectable_column
    id_column
    column :city
    column :state
    column :created_at
    actions
  end

  filter :city
  filter :state

  form do |f|
    f.inputs do
      f.input :city, as: :select, collection: City.all.map { |city|  [ city.name, city.id ] }, include_blank: false
    end
    f.actions
  end

end
