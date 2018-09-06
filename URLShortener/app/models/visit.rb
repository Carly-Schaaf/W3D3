# == Schema Information
#
# Table name: visits
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  short_url_id :integer
#  user_id      :integer
#

class Visit < ApplicationRecord
  
  def self.record_visit!(user, short_url)
    Visit.create(short_url_id: short_url.id, user_id: user.id)
  end
end
