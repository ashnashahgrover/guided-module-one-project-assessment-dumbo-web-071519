class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer   :user_id
      t.integer   :hack_id
      t.boolean   :likes
      t.string    :comment
    end
  end
end
