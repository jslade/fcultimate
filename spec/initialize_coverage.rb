# frozen_string_literal: true

if ENV['COVERAGE'] == '1'
  puts 'Code Coverage Enabled'
  begin
    require 'simplecov'

    SimpleCov.formatters = [
      SimpleCov::Formatter::HTMLFormatter
    ]

    SimpleCov.start do
      load_profile 'test_frameworks'

      add_filter '/config/'
      add_filter '/db/migrate'
      add_filter '/db/schema.rb'
      add_filter '/db/seeds.rb'

      add_group 'Config', 'config'
      add_group 'Controllers', 'app/controllers'
      add_group 'Libraries', 'lib'
      add_group 'Models', 'app/models'
      add_group 'Serializers', 'app/serializers'
      add_group 'Services', 'app/services'

      track_files '{app,config,lib,db}/**/*.rb'
    end

    SimpleCov.minimum_coverage(98)
    SimpleCov.maximum_coverage_drop(3)
    SimpleCov.minimum_coverage_by_file(90)
  end
end
