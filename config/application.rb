# frozen_string_literal: true

require 'bundler/setup'

Dir['app/*/*.rb'].sort.each { |f| require_relative "../#{ f }" }
