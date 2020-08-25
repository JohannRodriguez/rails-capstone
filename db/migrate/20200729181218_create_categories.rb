class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :priority

      t.timestamps
    end
  end

  Category.create(id:1, name: '1', priority: 1, created_at: '2020-07-30 07:40:30', updated_at: '2020-07-30 07:40:30')
  Category.create(id:2, name: '2', priority: 1, created_at: '2020-07-30 07:40:31', updated_at: '2020-07-30 07:40:31')
  Category.create(id:3, name: '3', priority: 1, created_at: '2020-07-30 07:40:32', updated_at: '2020-07-30 07:40:32')
end
