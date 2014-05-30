ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, force: true do |t|
    t.string :name
    t.timestamps
  end

  create_table :pages, force: true do |t|
    t.string :name
    t.timestamps
  end

  create_table :viewings, force: true do |t|
    t.references :viewable, polymorphic: true
    t.references :viewer, poloymorphic: true
    t.timestamps
  end
end
