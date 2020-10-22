class Movie < ApplicationRecord
  class << self
    def cached_movies_list
      Rails.cache.fetch(:cached_movies) do
        collection = Movie.list_all
        serialized_output = ActiveModelSerializers::SerializableResource.new(collection, each_serializer: PurchasableSerializer).to_json
        json_array = JSON.parse(serialized_output)
        json_array
      end
    end
  end
  has_many :purchase_options, as: :purchasable

  # Validations
  validates :title, :presence => true

  # Callbacks
  after_commit :update_cache, on: :create
  after_commit :update_cache, on: :destroy

  # scope
  scope :list_all, -> { all.order(created_at: :desc) }

  def update_cache
    Rails.cache.fetch(:cached_movies) do
      collection = Movie.list_all
      serialized_output = ActiveModelSerializers::SerializableResource.new(collection, each_serializer: PurchasableSerializer).to_json
      json_array = JSON.parse(serialized_output)
      json_array
    end
  end
end

# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  plot       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
