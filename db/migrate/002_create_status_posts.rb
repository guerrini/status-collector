migration 2, :create_status_posts do
  up do
    create_table :status_posts do
      column :id, DataMapper::Property::Serial
      column :project_id, DataMapper::Property::Integer
      column :start_date, DataMapper::Property::Date
      column :end_date, DataMapper::Property::Date
      column :status_report_id, DataMapper::Property::Integer
      column :content, DataMapper::Property::Text
    end
  end

  down do
    drop_table :status_posts
  end
end
