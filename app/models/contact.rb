class Contact < ActiveRecord::Base
  #Form valid
  validates :name, presence: true
  validates :email, :email_format => {:message => ': Please write a correct email'}
  validates :comments, presence: true
end