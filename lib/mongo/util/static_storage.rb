require 'singleton'

module Mongo
  class StaticStorage
    include Singleton
    attr_accessor :valid_seed_node
  end
end