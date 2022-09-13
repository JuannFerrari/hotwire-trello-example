# == Schema Information
#
# Table name: columns
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer          not null
#
# Indexes
#
#  index_columns_on_board_id  (board_id)
#
# Foreign Keys
#
#  board_id  (board_id => boards.id)
#
class Column < ApplicationRecord
  belongs_to :board
  has_many :cards, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :board_id, case_sensitive: false }

  after_create_commit -> {
    broadcast_append_to(board, target: "columns_container")
  }

  after_destroy_commit -> {
    broadcast_remove_to(board)
  }

  after_update_commit -> {
    broadcast_replace_to(board)
  }
end
