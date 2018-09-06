# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  long_url   :string
#  short_url  :string
#

class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :user_id, presence: true
  
  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
    
  
    
  
  def self.random_code
    random_code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(long_url: random_code)
      random_code = SecureRandom.urlsafe_base64
    end
    random_code
  end
  
  def self.make_short_url(user, long_link)
    short_link = ShortenedUrl.random_code
    new_row = ShortenedUrl.create(user_id: user.id, long_url: long_link, short_url: short_link)
    short_link
  end
end
