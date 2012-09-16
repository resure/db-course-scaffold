class Airplane < ActiveRecord::Base
  attr_accessible :airline_id, :airplane_model_id
  belongs_to :airline
  belongs_to :airplane_model
end
