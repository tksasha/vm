# frozen_string_literal: true

require 'yaml'

# TODO: spec me
class ApplicationModel
  class << self
    def database
      @database
    end

    def database=(database)
      @database = database
    end

    def all
      @all ||= YAML.safe_load File.read database
    end
  end
end
