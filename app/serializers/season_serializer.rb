class SeasonSerializer < ActiveModel::Serializer
  attributes :id,
             :plot,
             :title,
             :number,
             :created_at,
             :updated_at

  attribute :type do
    object.class.to_s
  end

  attribute :episodes do
    object.episodes.asc
  end
end
