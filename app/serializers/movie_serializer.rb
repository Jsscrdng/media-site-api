class MovieSerializer < ActiveModel::Serializer
  attributes :id,
             :plot,
             :title,
             :created_at,
             :updated_at

  attribute :type do
    object.class.to_s
  end
end
