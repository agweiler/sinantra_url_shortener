require 'uri'
require 'faker'

class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :valid_url, presence: true
  validates :original, :short, uniqueness: true

  def valid_url
    if URI.parse(self.original).kind_of? URI::HTTP
      self.original
    else
      nil
    end
  end

  before_save do
    self.short = "#{Faker::Lorem.characters(5)}" if self.short.nil?
  end
end
