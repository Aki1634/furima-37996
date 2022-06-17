class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string     :title,          null: false
      t.text       :explanation,    null: false
      t.integer    :price,          null: false
      t.integer    :category_id,    null: false
      t.integer    :situation_id,   null: false
      t.integer    :charge_id,      null: false
      t.integer    :prefectures_id, null: false
      t.integer    :ship_day_id,    null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
