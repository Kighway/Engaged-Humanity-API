class InterestCheckSerializer < ActiveModel::Serializer
  attributes :id, :title, :duplicate


  def duplicate
    true
  end

end
