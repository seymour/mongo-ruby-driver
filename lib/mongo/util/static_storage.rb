require 'singleton'
require 'pp'

module Mongo
  class StaticStorage
    include Singleton
    attr_accessor :unavailable_hosts

    def add_unavailable_host(host)
      @unavailable_hosts ||= []
      @unavailable_hosts << host unless @unavailable_hosts.include?(host)
    end

    def is_host_unavailable?(host)
      @unavailable_hosts ||= []
      @unavailable_hosts.include?(host)
    end
  end
end