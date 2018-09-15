# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  body       :text             not null
#  goal_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :body, :goal_id, :user_id, presence: true
  
  belongs_to :goal,
    foreign_key: :goal_id,
    class_name: :Goal
    
    belongs_to :user,
      foreign_key: :user_id,
      class_name: :User
end
