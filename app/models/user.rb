class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friend_requests_sent, class_name: "Friendrequest", foreign_key: "sender_id", dependent: :destroy
  has_many :friend_requests_receivers, through: :friend_requests_sent, source: :receiver, dependent: :destroy

  has_many :friend_requests_received, class_name: "Friendrequest", foreign_key: "receiver_id", dependent: :destroy
  has_many :friend_requests_senders, through: :friend_requests_received, source: :sender, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_one_attached :image
end


