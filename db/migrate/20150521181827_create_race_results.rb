class CreateRaceResults < ActiveRecord::Migration
  def change
    create_table :race_results do |t|
      t.belongs_to :horse, null: false
      t.string :date
      t.string :location
      t.string :weather
      t.string :lane
      t.string :meeting
      t.string :accommodation
      t.string :waku
      t.string :baban
      t.string :odds
      t.string :popularity
      t.string :order
      t.string :jockey
      t.string :kinweight
      t.string :distance
      t.string :condition
      t.string :time
      t.string :differrnce
      t.string :weight
      t.string :prize



      t.timestamps null: false
    end
  end
end
