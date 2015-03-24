migration 4, :create_projects do
  up do
    create_table :projects do
      column :id, DataMapper::Property::Serial
      column :category_id, DataMapper::Property::Integer
      column :name, DataMapper::Property::String, :length => 255
      column :description, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :projects
  end
end
