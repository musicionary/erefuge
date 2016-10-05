class Account < ApplicationRecord

  validates_presence_of :first_name, :last_name
  # has_and_belongs_to_many :events
  belongs_to :user

  #paperclip
  has_attached_file :avatar, styles: {medium: "500x", thumb: "100x100>"}, default_url: "/images/missing.png", :path =>"erefuge/:attachment/:style/:id.:extension"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
