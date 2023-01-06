# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  desc 'Create users from .csv file.'
  task :import_users, %i[path] => :environment do |_t, args|
    path = args[:path]
    abort 'Path is required!' unless path
    puts path

    abort 'Cant find data file!' unless File.exist? path

    data = File.read path

    puts 'Starting ro create users'
    CSV.parse(data, headers: true).each do |row|
      # изначально birthday - month/day/year
      # нужно - year/month/day
      row['birthday'] = Date.strptime row['birthday'], '%m/%d/%Y'

      User.create!(**row)

      print '.'
    end
    puts "\nUsers successfully created!"
  end
end
