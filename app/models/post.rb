class Post < ActiveRecord::Base
  before_save :check_caps

  has_many :comments  
  validates :name, presence: true
  validates :content, presence: true

  def check_caps
    name.capitalize
  end

end
