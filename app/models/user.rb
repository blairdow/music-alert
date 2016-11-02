class User < ActiveRecord::Base
    before_create :set_time_zone
    validates :email, uniqueness: true
    validate :email_check
    validates :password, length: { in: 6..20 }, if: ->(obj) {obj.new_record? || !obj.password.blank? }
    
    validates :first_name,:morning_commute, :evening_commute, :email, presence: true
    validates :first_name, :last_name, length: { minimum: 3 }
    
    has_secure_password
    
    has_attached_file :profile_photo, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/default.jpg"
    validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\z/
    
    
    has_many :media, dependent: :destroy
    
    has_many :active_relationships, class_name: "Relationship", 
                                    foreign_key: "follower_id", 
                                    dependent: :destroy 
    has_many :passive_relationships, class_name: "Relationship", 
                                    foreign_key: "followed_id", 
                                    dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships    
    
    def self.search(search)
        where("first_name ILIKE ? OR last_name ILIKE ?", "%#{search}%", "%#{search}%") 
    end
    
    def full_name
        self.first_name << " " << self.last_name
    end
    
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
    
    def set_time_zone
        self.morning_commute = self.morning_commute.in_time_zone(self.time_zone)

    end
    
    private
        def email_check
            unless self.email.include? '@'
                errors.add(:email, 'not a valid email')
            end
        end  

end
