class StatusPost
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :project_id, Integer, :index => :project
  property :start_date, Date
  property :end_date, Date, :index => :endofweek
  property :status_report_id, Integer, :index => :report
  property :content, Text

  belongs_to :project
  belongs_to :status_report
end
