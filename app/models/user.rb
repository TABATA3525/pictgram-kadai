class User < ApplicationRecord
    validates :name, 
      presence: true,
      length: { in:1..15 }
    
    validates :email, 
      presence: true,
      format: { with: /\A[a-zA-z0-9.!#$\%\&\'\*\+\/\=\?\^\_\`\{\|\}\~\-']+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+\z/ }
      
    validates :password, 
      length: { in:8..32 },
      format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/}

    has_secure_password
    
    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source: 'topic'
    has_many :comments
    has_many :comment_topics, through: :comments, source: 'topic'
    
end
