require "active_support/core_ext/string/strip"
require "pathname"
require "fileutils"

namespace :acts_as_viewable do
  desc "Create a migration"
  task :install do
    name = "create_viewings"
    version = Time.now.utc.strftime("%Y%m%d%H%M%S")

    ActiveRecord::Migrator.migrations_paths.each do |directory|
      next unless File.exists?(directory)
      migration_files = Pathname(directory).children
      if duplicate = migration_files.find { |path| path.basename.to_s.include?(name) }
        puts "Another migration is already named \"#{name}\": #{duplicate}."
        exit
      end
    end

    filename = "#{version}_#{name}.rb"
    dirname  = ActiveRecord::Migrator.migrations_path
    path     = File.join(dirname, filename)

    FileUtils.mkdir_p(dirname)
    File.write path, <<-MIGRATION.strip_heredoc
      class #{name.camelize} < ActiveRecord::Migration
        def change
          create_table :viewings, force: true do |t|
            t.references :viewer, polymorphic: true, null: false
            t.references :viewable, polymorphic: true, null: false
            t.timestamps
          end

          add_index :viewings, [:viewable_id, :viewable_type]
          add_index :viewings, [:viewer_id, :viewer_type]
        end
      end
    MIGRATION

    puts path
  end
end
