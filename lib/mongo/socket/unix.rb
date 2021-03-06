# Copyright (C) 2009-2014 MongoDB, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Mongo
  class Socket

    # Wrapper for Unix sockets.
    #
    # @since 3.0.0
    class Unix < Socket

      # @return [ String ] path The path to connect to.
      attr_reader :path

      # @return [ Float ] timeout The connection timeout.
      attr_reader :timeout

      # Establishes a socket connection.
      #
      # @example Connect the socket.
      #   sock.connect!
      #
      # @note This method mutates the object by setting the socket
      #   internally.
      #
      # @return [ Unix ] The connected socket instance.
      #
      # @since 3.0.0
      def connect!
        Timeout.timeout(timeout, Mongo::SocketTimeoutError) do
          socket.connect(path)
          self
        end
      end

      # Initializes a new Unix socket.
      #
      # @example Create the Unix socket.
      #   Unix.new('::1', 27017, 30)
      #   Unix.new('127.0.0.1', 27017, 30)
      #
      # @param [ String ] host The hostname or IP address.
      # @param [ Integer ] port The port number.
      # @param [ Float ] timeout The socket timeout value.
      # @param [ Integer ] family The socket family.
      #
      # @since 3.0.0
      def initialize(path, timeout, family)
        @path, @timeout = path, timeout
        super(family)
      end
    end
  end
end

