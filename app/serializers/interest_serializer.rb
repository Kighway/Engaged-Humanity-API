class InterestSerializer < ActiveModel::Serializer
  attributes :id, :title, :duplicate


  def duplicate
    false
  end

end
