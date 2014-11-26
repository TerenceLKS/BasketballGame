class CreateBasketballs < ActiveRecord::Migration
  def change
    create_table :basketballs do |t|
      t.date :date
      t.time :time
      t.string :team1
      t.string :team2
      t.string :location
      t.string :status
      t.string :winner
      t.integer :score

      t.timestamps
    end
  end
end
