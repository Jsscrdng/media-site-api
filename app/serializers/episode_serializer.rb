class EpisodeSerializer < ActiveModel::Serializer
  attributes :id,
             :plot,
             :title,
             :number,
             :created_at,
             :updated_at
end
