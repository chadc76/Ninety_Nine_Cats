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
require "test_helper"

class UserSessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
