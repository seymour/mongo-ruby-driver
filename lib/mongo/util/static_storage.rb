require 'singleton'

module Mongo
  class StaticStorage
    include Singleton
    attr_accessor :valid_seed_node

    def add_invalid_node(host)
      @invalid_nodes ||= []
      @invalid_nodes << host unless @invalid_nodes.include?(host)
    end

    def is_node_valid?(host)
      @invalid_nodes ||= []
      !@invalid_nodes.include?(host)
    end
  end
end