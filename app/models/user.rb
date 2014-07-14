class User < ActiveRecord::Base
  belongs_to :wallet, inverse_of :contributors
end
