fire_type = ElementType.create({name: 'fire'})

flamethrower = Move.create({name: 'flamethrower', element_type_id: fire_type.id})

char = Pokemon.create({name:'charmeleon'})

PokemonType.create({pokemon_id: char.id, element_type_id: fire_type.id})

AvailableMove.create({pokemon_id:char.id, move_id:flamethrower.id})
