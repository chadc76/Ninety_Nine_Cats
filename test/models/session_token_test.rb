# == Schema Information
#
# Table name: session_tokens
#
#  id                     :bigint           not null, primary key
#  user_sessions_table_id :integer          not null
#  token                  :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  env                    :string
#  location               :string
#
require "test_helper"

class SessionTokenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
