class PurchasableSerializer < ActiveModel::Serializer
  params :show_episodes

  attributes :id,
             :plot,
             :title,
             :created_at,
             :updated_at

  attribute :number, if: :a_season?

  attribute :type do
    object.class.to_s
  end

  attribute :episodes, if: :a_season? do
    object.episodes.asc
  end

  def a_season?
    object.class == Season
  end
end
