class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friend_requests_sent, class_name: "Friendrequest", foreign_key: "sender_id"
  has_many :friend_requests_receivers, through: :friend_requests_sent, source: :receiver

  has_many :friend_requests_received, class_name: "Friendrequest", foreign_key: "receiver_id"
  has_many :friend_requests_senders, through: :friend_requests_received, source: :sender

  has_many :comments
  has_many :posts
end


