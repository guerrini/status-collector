class StatusReport
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :start_date, Date
  property :end_date, Date, :key => true

  has n, :status_posts
end
