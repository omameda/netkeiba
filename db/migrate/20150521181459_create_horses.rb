class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.integer :horse_id , null: false
      t.string :name
      t.string :birth
      t.string :trainer
      t.string :owner
      t.string :breeder
      t.string :location
      t.string :centerprize
      t.string :localprize
      t.string :result
      t.string :inbreadfather
      t.string :inbreadmother
      t.string :father
      t.string :paternal_grandfather
      t.string :paternal_grandmother
      t.string :mother
      t.string :maternal_grandfather
      t.string :maternal_grandmother


      t.timestamps null: false
    end
  end
end
