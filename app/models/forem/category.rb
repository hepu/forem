require 'friendly_id'

module Forem
  class Category < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, :use => :slugged

    has_many :forums
    belongs_to :movement, class_name: "Movement"

    validates :name, :presence => true
    attr_accessible :name

    def to_s
      name
    end

    def forums_by_movement(movement)
      id = if (movement.respond_to?(:id))
        movement.id
      else
        movement
      end
      forums.where(movement_id: id)
    end

  end
end
