class Post < ApplicationRecord
include ActionView::Helpers::SanitizeHelper

belongs_to :user  
  
  def show_post_safe_html
  	sanitize(body)
  
  end


end

