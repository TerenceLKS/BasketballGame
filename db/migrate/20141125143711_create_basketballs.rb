class CreateBasketballs < ActiveRecord::Migration
  def change
    create_table :basketballs do |t|
      t.datetime :time
      t.integer :teams
      t.string :location
      t.string :status
      t.string :winner
      t.integer :score

      t.timestamps
    end
  end
end
