class Purchase < ApplicationRecord
  AVAILABILITY = 2.days.freeze

  scope :availables, -> { where(created_at: 2.days.ago..Time.now) }
  scope :by_creation, -> { order(created_at: :asc) }

  belongs_to :user
  belongs_to :purchase_option

  def expired?
    created_at <= 2.days.ago
  end
end

# == Schema Information
#
# Table name: purchases
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  purchase_option_id :bigint           not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_purchases_on_purchase_option_id  (purchase_option_id)
#  index_purchases_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (purchase_option_id => purchase_options.id)
#  fk_rails_...  (user_id => users.id)
#
