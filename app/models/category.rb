class Category < ActiveRecord::Base
  
  validates_presence_of :description
  
  def <=>(other)
    self.description <=> other.description
  end
end
