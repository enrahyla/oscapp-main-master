class Diary < ActiveRecord::Base
  attr_accessible :body, :title, :datetime

    searchable do
    text :title, :body
  end
end

 
