class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :phone, :address, :token
end
