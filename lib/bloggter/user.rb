module Bloggter
  class User < ActiveRecord::Base

    validates_presence_of   :handle
    validates_format_of     :handle, with: /\A[-A-Za-z0-9_]+\z/
    validates_uniqueness_of :handle

    has_many :entries

    attr_accessible :handle
  end
end