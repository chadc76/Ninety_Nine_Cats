# == Schema Information
#
# Table name: sessions
#
#  id                     :bigint           not null, primary key
#  user_sessions_table_id :integer          not null
#  session                :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require "test_helper"

class SessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end