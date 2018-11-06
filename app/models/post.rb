require 'zodiac'
class Post < ApplicationRecord
  include ActionView::Helpers::SanitizeHelper

  belongs_to :user  
  
  def show_post_safe_html
  	sanitize(body)
  end

  def zodiac_sign
    (created_at + (rand(1..12)).month).zodiac_sign
  end
end
