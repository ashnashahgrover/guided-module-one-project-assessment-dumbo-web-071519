class CreateHacks < ActiveRecord::Migration[5.2]
  def change
    create_table :hacks do |t|
      t.string    :heading
      t.string    :content
      t.integer   :user_id #to link back when a user creates a hack/ar
      
    end

  end
end
