class CreatePokemonJsons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemon_jsons do |t|
      t.integer :pokemon_id
      t.string :data
    end
  end
end
