class User < ActiveRecord::Base
    belongs_to :posts
end
