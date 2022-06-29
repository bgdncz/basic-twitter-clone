class User < ApplicationRecord
    has_many :tweets
    has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id
    has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id
    has_many :followeds, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true

    def to_s
        "#{self.name} (@#{self.username})"
    end

    def not_following
        User.all.reject {|u| u == self or u.followers.include? self}
    end
end
