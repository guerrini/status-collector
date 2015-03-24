migration 3, :create_status_reports do
  up do
    create_table :status_reports do
      column :id, DataMapper::Property::Serial
      column :start_date, DataMapper::Property::Date
      column :end_date, DataMapper::Property::Date
    end
  end

  down do
    drop_table :status_reports
  end
end
