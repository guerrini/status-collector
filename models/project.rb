class Project
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :category_id, Integer
  property :name, String, :length => 25
  property :description, String

  belongs_to :category
end
