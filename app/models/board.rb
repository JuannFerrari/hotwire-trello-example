# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  has_many :columns, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
