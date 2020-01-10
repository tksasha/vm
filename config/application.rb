# frozen_string_literal: true

require 'bundler/setup'

Dir['app/*/*.rb'].each { |f| require_relative "../#{ f }" }
