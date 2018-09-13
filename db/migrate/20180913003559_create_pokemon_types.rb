class CreatePokemonTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemon_types do |t|
      t.integer :pokemon_id
      t.integer :element_type_id
    end
  end
end
