# == Schema Information
#
# Table name: user_sessions
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  session_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserSession < ApplicationRecord
end
