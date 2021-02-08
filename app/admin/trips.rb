ActiveAdmin.register Trip do
  permit_params :cab, :user

  index do
    selectable_column
    id_column
    column :cab
    column :user
    column :start_time
    column :end_time
    actions
  end

  filter :user
  filter :cab

  show do |trip|
    attributes_table do
      row :cab
      row :user
      row :start_time
      row :end_time
    end
  end
end
