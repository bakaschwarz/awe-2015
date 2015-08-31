require 'uri'
class Project < ActiveRecord::Base

  # Muchas gracias
  # http://stackoverflow.com/questions/1805761/check-if-url-is-valid-ruby
  VALID_URL_REGEX = /\A#{URI::regexp(['http', 'https'])}\z/

  validates :repo, presence: true, format: {with: VALID_URL_REGEX}, allow_nil: true
  belongs_to :group
end
