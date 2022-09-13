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
class Card < ApplicationRecord
  belongs_to :column, touch: true
  acts_as_list scope: :column

  delegate :board, to: :column

  after_create_commit -> {
    broadcast_append_to(board, target: "column_#{column_id}_cards_container", locals: { card: self, board_id: board.id, column_id: column.id})
  }

  after_destroy_commit -> { broadcast_remove_to(board) }
end
