migration 5, :create_categories do
  up do
    create_table :categories do
      column :id, DataMapper::Property::Serial
      column :name, DataMapper::Property::String, :length => 255
      column :description, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :categories
  end
end
