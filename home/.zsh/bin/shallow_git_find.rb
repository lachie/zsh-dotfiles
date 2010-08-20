#!/usr/bin/env ruby

require 'rubygems'
require 'sequel'
require 'pathname'

dbfile = Pathname(ARGV.shift).expand_path
DB = Sequel.sqlite(dbfile.to_s)

# create an items table
DB.create_table? :git_repos do
  String :basename
  String :path
  Boolean :dont_delete
end

repos = DB[:git_repos]

ARGV.each do |root|
  root   = Pathname(root).expand_path

  root.find do |path|
    next unless path.directory?

    if path.join('.git').directory?

      if (existing = repos[:path => path.to_s]) && !existing.dont_delete

        repos.update(:basename => path.basename.to_s,
                     :dont_delete => false,
                     :path => path.to_s)
      else
        repos.insert(:basename => path.basename.to_s, 
                     :dont_delete => false,
                      :path => path.to_s)
      end

      Find.prune
    end
  end
end
