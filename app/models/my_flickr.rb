class MyFlickr < ActiveRecord::Base
  # attr_accessible :title, :body

  def initialize 
if MY_CONFIG[:rflickr_lib] 
if MY_CONFIG[:flickr_cache_file] 
super(MY_CONFIG[:flickr_cache_file], MY_CONFIG[:flickr_key],MY_CONFIG[:flickr_shared_secret]) 
else 
super(nil, MY_CONFIG[:flickr_key]) 
auth_mode = false 
end 
else 
super 
end 
end 

def my_search(user_id='29281775@N00', per_page = 10, page = 1) 
tags=nil 
tag_mode=nil 
text=nil 
min_upload_date=nil 
max_upload_date=nil 
min_taken_date=nil 
max_taken_date=nil 
license=nil 
extras=nil 
sort=nil 


if MY_CONFIG[:rflickr_lib] 
photos.search(user_id,tags,tag_mode,text,min_upload_date, 
max_upload_date,min_taken_date,max_taken_date, 
license,extras,per_page,page,sort) 
else 
people_getPublicPhotos(:user_id => user_id, :per_page => per_page.to_s, :page => page.to_s)['photos']['photo'].collect { |photo| Photo.new(photo['id']) } 
end 
end 


end 