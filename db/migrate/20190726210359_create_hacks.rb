class CreateHacks < ActiveRecord::Migration[5.2]
  def change
    create_table :hacks do |t|
      t.string    :heading
      t.string    :content
      t.integer   :writer_id
    end
  end
end
