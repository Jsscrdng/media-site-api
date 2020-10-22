class Season < ApplicationRecord
  class << self
    def cached_seasons_list
      Rails.cache.fetch(:cached_seasons) do
        collection = Season.includes(:episodes).list_all
        serialized_output = ActiveModelSerializers::SerializableResource.new(collection, each_serializer: SeasonSerializer).to_json
        json_array = JSON.parse(serialized_output)
        json_array
      end
    end
  end
  has_many :purchase_options, as: :purchasable
  has_many :episodes

  # Validations
  validates :title, presence: true

  # Callbacks
  after_commit :update_cache, on: :create
  after_commit :update_cache, on: :destroy

  # scope
  scope :list_all, -> { all.order(created_at: :desc) }
  scope :asc, -> { order(number: :asc) }

  def update_cache
    Rails.cache.fetch(:cached_seasons) do
      collection = Season.includes(:episodes).list_all
      serialized_output = ActiveModelSerializers::SerializableResource.new(collection, each_serializer: SeasonSerializer).to_json
      json_array = JSON.parse(serialized_output)
      json_array
    end
  end
end

# == Schema Information
#
# Table name: seasons
#
#  id         :bigint           not null, primary key
#  number     :integer
#  plot       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
