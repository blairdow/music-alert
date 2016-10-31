class User < ActiveRecord::Base
    
    validates :email, presence: true, uniqueness: true
    validate :email_check
    validates :password, length: { in: 6..20 }
    
    validates :first_name, presence: true
    validates :first_name, length: { minimum: 3 }
    
    validates :last_name, presence: true
    validates :last_name, length: { minimum: 3 }
    
    has_secure_password
    
    has_many :media
    
    has_many :active_relationships, class_name: "Relationship", 
                                    foreign_key: "follower_id", 
                                    dependent: :destroy 
    has_many :passive_relationships, class_name: "Relationship", 
                                    foreign_key: "followed_id", 
                                    dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships    
    
    def follow(other_user)
        active_relationships.create(followed_id: other_user.id)
    end

      # Unfollows a user.
    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end

      # Returns true if the current user is following the other user.
    def following?(other_user)
        following.include?(other_user)
    end
    
    private
        def email_check
            unless self.email.include? '@'
                errors.add(:email, 'not a valid email')
            end
        end  

end
