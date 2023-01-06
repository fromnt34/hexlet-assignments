# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  desc 'Create users from .csv file.'
  task :import_users, [:path] => :environment do |_t, args|
    puts 'Starting ro create users'
    CSV.foreach(args[:path], headers: true) do |data|
      # изначально birthday - month/day/year
      # нужно - year/month/day
      birthday = data['birthday'].split('/')
      data['birthday'] = [birthday[2], birthday[0], birthday[1]].join('/')

      User.create(**data)

      print '.'
    end
    puts "\nUsers successfully created!"
  end
end
