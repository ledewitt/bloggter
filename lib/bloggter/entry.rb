module Bloggter
  class Entry < ActiveRecord::Base
    
    validates_presence_of :body, :user
    validates_length_of   :body, maximum: 384
    
    belongs_to :user
    
    attr_accessible :body
  end
end