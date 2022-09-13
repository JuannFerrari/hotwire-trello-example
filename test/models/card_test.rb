# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  column_id  :integer          not null
#
# Indexes
#
#  index_cards_on_column_id  (column_id)
#
# Foreign Keys
#
#  column_id  (column_id => columns.id)
#
require "test_helper"

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
