//
//  PokemonTypes.swift
//  PokemonHelp
//
//  Created by Smith, Sam on 12/28/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import Foundation


enum PokemonType: String, CaseIterable {
        case Normal
        case Fighting
        case Flying
        case Poison
        case Ground
        case Rock
        case Bug
        case Ghost
        case Steel
        case Fire
        case Water
        case Grass
        case Electric
        case Psychic
        case Ice
        case Dragon
        case Dark
        case Fairy
    }

enum PokemonVarieties: String, CaseIterable {
    case Bulbasaur
    case Ivysour
    case Venusaur
    case Charmander
    case Charmeleon
    case Charizard
    case Squirtle
    case Wartortle
    case Blastoise
    case Caterpie
    case Metapod
    case Butterfree
    case Weedle
    case Kakuna
    case Beedrill
    case Pidgey
    case Pidgeotto
    case Pidgeot
    case Rattata
    case Ratticate
    case Spearow
    case Fearow
    case Ekans
    case Arbok
    case Pikachu
    case Raichu
    case Sandshrew
    case Sandslash
    case NidoranF
    case Nidorina
    case Nidoqueen
    case NidoranM
    case Nidorino
    case Nidoking
    case Clefairy
    case Clefable
    case Vulpix
    case Ninetales
    case Jigglypuff
    case Wigglytuff
    case Zubat
    case Golbat
    case Oddish
    case Gloom
    case Vileplume
    case Paras
    case Parasect
    case Venonat
    case Venomoth
    case Diglett
    case Dugtrio
    case Meowth
    case Persian
    case Psyduck
    case Golduck
    case Mankey
    case Primeape
    case Growlithe
    case Arcanine
    case Poliwag
    case Poliwhirl
    case Poliwrath
    case Abra
    case Kadabra
    case Alakazam
    case Machop
    case Machoke
    case Machamp
    case Bellsprout
    case Weepinbell
    case Victreebel
    case Tentacool
    case Tentacruel
    case Geodude
    case Graveler
    case Golem
    case Ponyta
    case Rapidash
    case Slowpoke
    case Slowbro
    case Magnemite
    case Magneton
    case Farfetchd
    case Doduo
    case Dodrio
    case Seel
    case Dewgong
    case Grimer
    case Muk
    case Shellder
    case Cloyster
    case Gastly
    case Haunter
    case Gengar
    case Onix
    case Drowzee
    case Hypno
    case Krabby
    case Kingler
    case Voltorb
    case Electrode
    case Exeggcute
    case Exeggutor
    case Cubone
    case Marowak
    case Hitmonlee
    case Hitmonchan
    case Lickitung
    case Koffing
    case Weezing
    case Rhyhorn
    case Rhydon
    case Chansey
    case Tangela
    case Kangaskhan
    case Horsea
    case Seadra
    case Goldeen
    case Seaking
    case Staryu
    case Starmie
    case MrMime
    case Scyther
    case Jynx
    case Electabuzz
    case Magmar
    case Pinsir
    case Tauros
    case Magikarp
    case Gyarados
    case Lapras
    case Ditto
    case Eevee
    case Vaporeon
    case Jolteon
    case Flareon
    case Porygon
    case Omanyte
    case Omastar
    case Kabuto
    case Kabutops
    case Aerodactyl
    case Snorlax
    case Articuno
    case Zapdos
    case Moltres
    case Dratini
    case Dragonair
    case Dragonite
    case Mewtwo
    case Mew
}

enum Details {
    case PType
    case Evolutions
    case Number
}

class Pokemon {
    var name: PokemonVarieties
    
    func getInfo(for pokemon: PokemonVarieties) -> [Details: Any?] {
        var info = [Details: Any?]()
        switch pokemon {
        case .Bulbasaur:
            info[.PType] = [PokemonType.Grass, PokemonType.Poison]
            info[.Evolutions] = [PokemonVarieties.Ivysour, PokemonVarieties.Venusaur]
            info[.Number] = Int(1)
        case .Ivysour:
            info[.PType] = [PokemonType.Grass, .Poison]
            info[.Evolutions] = [PokemonVarieties.Venusaur]
            info[.Number] = Int(2)
        case .Venusaur:
            info[.PType] = [PokemonType.Grass, .Poison]
            info[.Number] = Int(3)
        case .Charmander:
            info[.PType] = [PokemonType.Fire]
            info[.Evolutions] = [PokemonVarieties.Charmeleon, PokemonVarieties.Charizard]
            info[.Number] = Int(4)
        case .Charmeleon:
            info[.PType] = [PokemonType.Fire]
            info[.Evolutions] = [PokemonVarieties.Charizard]
            info[.Number] = Int(5)
        case .Charizard:
            info[.PType] = [PokemonType.Fire,.Flying]
            info[.Number] = Int(6)
        case .Squirtle:
            info[.PType] = [PokemonType.Water]
            info[.Number] = Int(7)
            info[.Evolutions] = [PokemonVarieties.Wartortle, .Blastoise]
        case .Wartortle:
            info[.PType] = [PokemonType.Water]
            info[.Number] = Int(8)
            info[.Evolutions] = [PokemonVarieties.Blastoise]
        case .Blastoise:
            info[.PType] = [PokemonType.Water]
            info[.Number] = Int(9)
        case .Caterpie:
            info[.PType] = [PokemonType.Bug]
            info[.Number] = Int(10)
            info[.Evolutions] = [PokemonVarieties.Metapod, .Butterfree]
        case .Metapod:
            info[.Number] = Int(11)
            info[.PType] = [PokemonType.Bug]
            info[.Evolutions] = [PokemonVarieties.Butterfree]
        case .Butterfree:
            info[.PType] = [PokemonType.Bug, .Flying]
        case .Weedle:
            info[.PType] = [PokemonType.Bug, .Poison]
        case .Kakuna:
            info[.PType] = [PokemonType.Bug, .Poison]
        case .Beedrill:
            info[.PType] = [PokemonType.Bug, .Poison]
        case .Pidgey:
            info[.PType] = [PokemonType.Normal, .Flying]
        case .Pidgeotto:
            info[.PType] = [PokemonType.Normal, .Flying]
        case .Pidgeot:
            info[.PType] = [PokemonType.Normal, .Flying]
        case .Rattata:
            info[.PType] = [PokemonType.Normal]
        case .Ratticate:
            info[.PType] = [PokemonType.Normal]
        case .Spearow:
            info[.PType] = [PokemonType.Normal, .Flying]
        case .Fearow:
            info[.PType] = [PokemonType.Normal, .Flying]
        case .Ekans:
            info[.PType] = [PokemonType.Poison]
        case .Arbok:
            info[.PType] = [PokemonType.Poison]
        case .Pikachu:
            info[.PType] = [PokemonType.Electric]
        case .Raichu:
            info[.PType] = [PokemonType.Electric]
        case .Sandshrew:
            info[.PType] = [PokemonType.Ground]
        case .Sandslash:
            info[.PType] = [PokemonType.Ground]
        case .NidoranF:
            info[.PType] = [PokemonType.Poison]
        case .Nidorina:
            info[.PType] = [PokemonType.Poison]
        case .Nidoqueen:
            info[.PType] = [PokemonType.Poison, PokemonType.Ground]
        case .NidoranM:
            info[.PType] = [PokemonType.Poison]
        case .Nidorino:
            info[.PType] = [PokemonType.Poison]
        case .Nidoking:
            info[.PType] = [PokemonType.Poison, PokemonType.Ground]
        case .Clefairy:
            info[.PType] = [PokemonType.Fairy]
        case .Clefable:
            info[.PType] = [PokemonType.Fairy]
        case .Vulpix:
            info[.PType] = [PokemonType.Fire]
        case .Ninetales:
            info[.PType] = [PokemonType.Fire]
        case .Jigglypuff:
            info[.PType] = [PokemonType.Normal, PokemonType.Fairy]
        case .Wigglytuff:
            info[.PType] = [PokemonType.Normal, PokemonType.Fairy]
        case .Zubat:
            info[.PType] = [PokemonType.Poison, .Flying]
        case .Golbat:
            info[.PType] = [PokemonType.Poison, .Flying]
        case .Oddish:
            info[.PType] = [PokemonType.Grass, PokemonType.Poison]
        case .Gloom:
            info[.PType] = [PokemonType.Grass, PokemonType.Poison]
        case .Vileplume:
            info[.PType] = [PokemonType.Grass, PokemonType.Poison]
        case .Paras:
            info[.PType] = [PokemonType.Bug, PokemonType.Grass]
        case .Parasect:
            info[.PType] = [PokemonType.Bug, PokemonType.Grass]
        case .Venonat:
            info[.PType] = [PokemonType.Bug, PokemonType.Grass]
        case .Venomoth:
            info[.PType] = [PokemonType.Bug, PokemonType.Grass]
        case .Diglett:
            info[.PType] = [PokemonType.Ground]
        case .Dugtrio:
            info[.PType] = [PokemonType.Ground]
        case .Meowth:
            info[.PType] = [PokemonType.Normal]
        case .Persian:
            info[.PType] = [PokemonType.Normal]
        case .Psyduck:
            info[.PType] = [PokemonType.Water]
        case .Golduck:
            info[.PType] = [PokemonType.Water]
        case .Mankey:
            info[.PType] = [PokemonType.Fighting]
        case .Primeape:
            info[.PType] = [PokemonType.Fighting]
        case .Growlithe:
            info[.PType] = [PokemonType.Fire]
        case .Arcanine:
            info[.PType] = [PokemonType.Fire]
        case .Poliwag:
            info[.PType] = [PokemonType.Water]
        case .Poliwhirl:
            info[.PType] = [PokemonType.Water]
        case .Poliwrath:
            info[.PType] = [PokemonType.Water, PokemonType.Fighting]
        case .Abra:
            info[.PType] = [PokemonType.Psychic]
        case .Kadabra:
            info[.PType] = [PokemonType.Psychic]
        case .Alakazam:
            info[.PType] = [PokemonType.Psychic]
        case .Machop:
            info[.PType] = [PokemonType.Fighting]
        case .Machoke:
            info[.PType] = [PokemonType.Fighting]
        case .Machamp:
            info[.PType] = [PokemonType.Fighting]
        case .Bellsprout:
            info[.PType] = [PokemonType.Grass, PokemonType.Poison]
        case .Weepinbell:
            info[.PType] = [PokemonType.Grass, PokemonType.Poison]
        case .Victreebel:
            info[.PType] = [PokemonType.Grass, PokemonType.Poison]
        case .Tentacool:
            info[.PType] = [PokemonType.Water, PokemonType.Poison]
        case .Tentacruel:
            info[.PType] = [PokemonType.Water, PokemonType.Poison]
        case .Geodude:
            info[.PType] = [.Rock, PokemonType.Ground]
        case .Graveler:
            info[.PType] = [.Rock, PokemonType.Ground]
        case .Golem:
            info[.PType] = [.Rock, PokemonType.Ground]
        case .Ponyta:
            info[.PType] = [PokemonType.Fire]
        case .Rapidash:
            info[.PType] = [PokemonType.Fire]
        case .Slowpoke:
            info[.PType] = [PokemonType.Water, PokemonType.Psychic]
        case .Slowbro:
            info[.PType] = [PokemonType.Water, PokemonType.Psychic]
        case .Magnemite:
            info[.PType] = [PokemonType.Electric, .Steel]
        case .Magneton:
            info[.PType] = [PokemonType.Electric, .Steel]
        case .Farfetchd:
            info[.PType] = [PokemonType.Normal,.Flying]
        case .Doduo:
            info[.PType] = [PokemonType.Normal,.Flying]
        case .Dodrio:
            info[.PType] = [PokemonType.Normal,.Flying]
        case .Seel:
            info[.PType] = [PokemonType.Water]
        case .Dewgong:
            info[.PType] = [PokemonType.Water, .Ice]
        case .Grimer:
            info[.PType] = [PokemonType.Poison]
        case .Muk:
            info[.PType] = [PokemonType.Poison]
        case .Shellder:
            info[.PType] = [PokemonType.Water]
        case .Cloyster:
            info[.PType] = [PokemonType.Water, .Ice]
        case .Gastly:
            info[.PType] = [.Ghost, PokemonType.Poison]
        case .Haunter:
            info[.PType] = [.Ghost, PokemonType.Poison]
        case .Gengar:
            info[.PType] = [.Ghost, PokemonType.Poison]
        case .Onix:
            info[.PType] = [.Rock, PokemonType.Ground]
        case .Drowzee:
            info[.PType] = [PokemonType.Psychic]
        case .Hypno:
            info[.PType] = [PokemonType.Psychic]
        case .Krabby:
            info[.PType] = [PokemonType.Water]
        case .Kingler:
            info[.PType] = [PokemonType.Water]
        case .Voltorb:
            info[.PType] = [PokemonType.Electric]
        case .Electrode:
            info[.PType] = [PokemonType.Electric]
        case .Exeggcute:
            info[.PType] = [PokemonType.Grass, PokemonType.Psychic]
        case .Exeggutor:
            info[.PType] = [PokemonType.Grass, PokemonType.Psychic]
        case .Cubone:
            info[.PType] = [PokemonType.Ground]
        case .Marowak:
            info[.PType] = [PokemonType.Ground]
        case .Hitmonlee:
            info[.PType] = [PokemonType.Fighting]
        case .Hitmonchan:
            info[.PType] = [PokemonType.Fighting]
        case .Lickitung:
            info[.PType] = [PokemonType.Normal]
        case .Koffing:
            info[.PType] = [PokemonType.Poison]
        case .Weezing:
            info[.PType] = [PokemonType.Poison]
        case .Rhyhorn:
            info[.PType] = [PokemonType.Ground, .Rock]
        case .Rhydon:
            info[.PType] = [PokemonType.Ground, .Rock]
        case .Chansey:
            info[.PType] = [PokemonType.Normal]
        case .Tangela:
            info[.PType] = [PokemonType.Grass]
        case .Kangaskhan:
            info[.PType] = [PokemonType.Normal]
        case .Horsea:
            info[.PType] = [PokemonType.Water]
        case .Seadra:
            info[.PType] = [PokemonType.Water]
        case .Goldeen:
            info[.PType] = [PokemonType.Water]
        case .Seaking:
            info[.PType] = [PokemonType.Water]
        case .Staryu:
            info[.PType] = [PokemonType.Water]
        case .Starmie:
            info[.PType] = [PokemonType.Water, PokemonType.Psychic]
        case .MrMime:
            info[.PType] = [PokemonType.Psychic, PokemonType.Fairy]
        case .Scyther:
            info[.PType] = [PokemonType.Bug, .Flying]
        case .Jynx:
            info[.PType] = [.Ice, PokemonType.Psychic]
        case .Electabuzz:
            info[.PType] = [PokemonType.Electric]
        case .Magmar:
            info[.PType] = [PokemonType.Fire]
        case .Pinsir:
            info[.PType] = [PokemonType.Bug]
        case .Tauros:
            info[.PType] = [PokemonType.Normal]
        case .Magikarp:
            info[.PType] = [PokemonType.Water]
        case .Gyarados:
            info[.PType] = [PokemonType.Water, .Flying]
        case .Lapras:
            info[.PType] = [PokemonType.Water, .Ice]
        case .Ditto:
            info[.PType] = [PokemonType.Normal]
        case .Eevee:
            info[.PType] = [PokemonType.Normal]
        case .Vaporeon:
            info[.PType] = [PokemonType.Water]
        case .Jolteon:
            info[.PType] = [PokemonType.Electric]
        case .Flareon:
            info[.PType] = [PokemonType.Fire]
        case .Porygon:
            info[.PType] = [PokemonType.Normal]
        case .Omanyte:
            info[.PType] = [.Rock, PokemonType.Water]
        case .Omastar:
            info[.PType] = [.Rock, PokemonType.Water]
        case .Kabuto:
            info[.PType] = [.Rock, PokemonType.Water]
        case .Kabutops:
            info[.PType] = [.Rock, PokemonType.Water]
        case .Aerodactyl:
            info[.PType] = [PokemonType.Rock, .Flying]
        case .Snorlax:
            info[.PType] = [PokemonType.Normal]
        case .Articuno:
            info[.PType] = [PokemonType.Ice, .Flying]
        case .Zapdos:
            info[.PType] = [PokemonType.Electric, .Flying]
        case .Moltres:
            info[.PType] = [PokemonType.Fire, .Flying]
        case .Dratini:
            info[.PType] = [PokemonType.Dragon]
        case .Dragonair:
            info[.PType] = [PokemonType.Dragon]
        case .Dragonite:
            info[.PType] = [PokemonType.Dragon, .Flying]
        case .Mewtwo:
            info[.PType] = [PokemonType.Psychic]
        case .Mew:
            info[.PType] = [PokemonType.Psychic]
        }
        return info
    }
    
    var type: [PokemonType] {
        switch self.name {
        case .Bulbasaur:
            return [PokemonType.Grass, .Poison]
        case .Ivysour:
            return [PokemonType.Grass, .Poison]
        case .Venusaur:
            return [PokemonType.Grass, .Poison]
        case .Charmander:
            return [.Fire]
        case .Charmeleon:
            return [.Fire]
        case .Charizard:
            return [.Fire,.Flying]
        case .Squirtle:
            return [.Water]
        case .Wartortle:
            return [.Water]
        case .Blastoise:
            return [.Water]
        case .Caterpie:
            return [.Bug]
        case .Metapod:
            return [.Bug]
        case .Butterfree:
            return [.Bug, .Flying]
        case .Weedle:
            return [.Bug, .Poison]
        case .Kakuna:
            return [.Bug, .Poison]
        case .Beedrill:
            return [.Bug, .Poison]
        case .Pidgey:
            return [.Normal, .Flying]
        case .Pidgeotto:
            return [.Normal, .Flying]
        case .Pidgeot:
            return [.Normal, .Flying]
        case .Rattata:
            return [.Normal]
        case .Ratticate:
            return [.Normal]
        case .Spearow:
            return [.Normal, .Flying]
        case .Fearow:
            return [.Normal, .Flying]
        case .Ekans:
            return [.Poison]
        case .Arbok:
            return [.Poison]
        case .Pikachu:
            return [.Electric]
        case .Raichu:
            return [.Electric]
        case .Sandshrew:
            return [.Ground]
        case .Sandslash:
            return [.Ground]
        case .NidoranF:
            return [.Poison]
        case .Nidorina:
            return [.Poison]
        case .Nidoqueen:
            return [.Poison, .Ground]
        case .NidoranM:
            return [.Poison]
        case .Nidorino:
            return [.Poison]
        case .Nidoking:
            return [.Poison, .Ground]
        case .Clefairy:
            return [PokemonType.Fairy]
        case .Clefable:
            return [PokemonType.Fairy]
        case .Vulpix:
            return [.Fire]
        case .Ninetales:
            return [.Fire]
        case .Jigglypuff:
            return [.Normal, PokemonType.Fairy]
        case .Wigglytuff:
            return [.Normal, PokemonType.Fairy]
        case .Zubat:
            return [.Poison, .Flying]
        case .Golbat:
            return [.Poison, .Flying]
        case .Oddish:
            return [PokemonType.Grass, .Poison]
        case .Gloom:
            return [PokemonType.Grass, .Poison]
        case .Vileplume:
            return [.Grass, .Poison]
        case .Paras:
            return [.Bug, .Grass]
        case .Parasect:
            return [.Bug, .Grass]
        case .Venonat:
            return [.Bug, .Grass]
        case .Venomoth:
            return [.Bug, .Grass]
        case .Diglett:
            return [.Ground]
        case .Dugtrio:
            return [.Ground]
        case .Meowth:
            return [.Normal]
        case .Persian:
            return [.Normal]
        case .Psyduck:
            return [.Water]
        case .Golduck:
            return [.Water]
        case .Mankey:
            return [.Fighting]
        case .Primeape:
            return [.Fighting]
        case .Growlithe:
            return [.Fire]
        case .Arcanine:
            return [.Fire]
        case .Poliwag:
            return [.Water]
        case .Poliwhirl:
            return [.Water]
        case .Poliwrath:
            return [.Water, .Fighting]
        case .Abra:
            return [.Psychic]
        case .Kadabra:
            return [.Psychic]
        case .Alakazam:
            return [.Psychic]
        case .Machop:
            return [.Fighting]
        case .Machoke:
            return [.Fighting]
        case .Machamp:
            return [.Fighting]
        case .Bellsprout:
            return [.Grass, .Poison]
        case .Weepinbell:
            return [.Grass, .Poison]
        case .Victreebel:
            return [.Grass, .Poison]
        case .Tentacool:
            return [.Water, .Poison]
        case .Tentacruel:
            return [.Water, .Poison]
        case .Geodude:
            return [.Rock, .Ground]
        case .Graveler:
            return [.Rock, .Ground]
        case .Golem:
            return [.Rock, .Ground]
        case .Ponyta:
            return [.Fire]
        case .Rapidash:
            return [.Fire]
        case .Slowpoke:
            return [.Water, .Psychic]
        case .Slowbro:
            return [.Water, .Psychic]
        case .Magnemite:
            return [.Electric, .Steel]
        case .Magneton:
            return [.Electric, .Steel]
        case .Farfetchd:
            return [.Normal,.Flying]
        case .Doduo:
            return [.Normal,.Flying]
        case .Dodrio:
            return [.Normal,.Flying]
        case .Seel:
            return [.Water]
        case .Dewgong:
            return [.Water, .Ice]
        case .Grimer:
            return [.Poison]
        case .Muk:
            return [.Poison]
        case .Shellder:
            return [.Water]
        case .Cloyster:
            return [.Water, .Ice]
        case .Gastly:
            return [.Ghost, .Poison]
        case .Haunter:
            return [.Ghost, .Poison]
        case .Gengar:
            return [.Ghost, .Poison]
        case .Onix:
            return [.Rock, .Ground]
        case .Drowzee:
            return [.Psychic]
        case .Hypno:
            return [.Psychic]
        case .Krabby:
            return [.Water]
        case .Kingler:
            return [.Water]
        case .Voltorb:
            return [.Electric]
        case .Electrode:
            return [.Electric]
        case .Exeggcute:
            return [.Grass, .Psychic]
        case .Exeggutor:
            return [.Grass, .Psychic]
        case .Cubone:
            return [.Ground]
        case .Marowak:
            return [.Ground]
        case .Hitmonlee:
            return [.Fighting]
        case .Hitmonchan:
            return [.Fighting]
        case .Lickitung:
            return [.Normal]
        case .Koffing:
            return [.Poison]
        case .Weezing:
            return [.Poison]
        case .Rhyhorn:
            return [.Ground, .Rock]
        case .Rhydon:
            return [.Ground, .Rock]
        case .Chansey:
            return [.Normal]
        case .Tangela:
            return [.Grass]
        case .Kangaskhan:
            return [.Normal]
        case .Horsea:
            return [.Water]
        case .Seadra:
            return [.Water]
        case .Goldeen:
            return [.Water]
        case .Seaking:
            return [.Water]
        case .Staryu:
            return [.Water]
        case .Starmie:
            return [.Water, .Psychic]
        case .MrMime:
            return [.Psychic, PokemonType.Fairy]
        case .Scyther:
            return [.Bug, .Flying]
        case .Jynx:
            return [.Ice, .Psychic]
        case .Electabuzz:
            return [.Electric]
        case .Magmar:
            return [.Fire]
        case .Pinsir:
            return [.Bug]
        case .Tauros:
            return [.Normal]
        case .Magikarp:
            return [.Water]
        case .Gyarados:
            return [.Water, .Flying]
        case .Lapras:
            return [.Water, .Ice]
        case .Ditto:
            return [.Normal]
        case .Eevee:
            return [.Normal]
        case .Vaporeon:
            return [.Water]
        case .Jolteon:
            return [.Electric]
        case .Flareon:
            return [.Fire]
        case .Porygon:
            return [.Normal]
        case .Omanyte:
            return [.Rock, .Water]
        case .Omastar:
            return [.Rock, .Water]
        case .Kabuto:
            return [.Rock, .Water]
        case .Kabutops:
            return [.Rock, .Water]
        case .Aerodactyl:
            return [.Rock, .Flying]
        case .Snorlax:
            return [.Normal]
        case .Articuno:
            return [.Ice, .Flying]
        case .Zapdos:
            return [.Electric, .Flying]
        case .Moltres:
            return [.Fire, .Flying]
        case .Dratini:
            return [.Dragon]
        case .Dragonair:
            return [.Dragon]
        case .Dragonite:
            return [.Dragon, .Flying]
        case .Mewtwo:
            return [.Psychic]
        case .Mew:
            return [.Psychic]
        }
    }
    
    init(name: PokemonVarieties) {
        self.name = name
    }
    
    static func weakness(target: PokemonType, attacker: PokemonType) -> Double {
        switch target{
            
        case .Normal:
            switch attacker {
            case .Fighting:
                return 2.0
            case .Ghost:
                return 0
            default:
                return 1.0
            }
            
        case .Fighting:
            switch attacker {
            case .Flying, .Psychic, .Fairy:
                return 2.0
            case .Rock, .Bug, .Dark:
                return 0.5
            default:
                return 1.0
            }
            
        case .Flying:
            switch attacker {
            case .Rock, .Electric, .Ice:
                return 2.0
            case .Fighting, .Bug, .Grass:
                return 0.5
            case .Ground:
                return 0.0
            default:
                return 1.0
            }
            
        case .Poison:
            switch attacker {
            case .Ground, .Psychic:
                return 2.0
            case .Fighting, .Poison, .Bug, .Grass, .Fairy:
                return 0.5
            default:
                return 1.0
            }
        case .Ground:
            switch attacker {
            case .Water, .Grass, .Ice:
                return 2.0
            case .Poison, .Rock:
                return 0.5
            case .Electric:
                return 0.0
            default:
                return 1.0
            }
        case .Rock:
            switch attacker {
            case .Fighting, .Ground, .Steel, .Water, .Grass:
                return 2.0
            case .Normal, .Flying, .Poison, .Fire:
                return 0.5
            default:
                return 1.0
            }
        case .Bug:
            switch attacker {
            case .Flying, .Rock, .Fire:
                return 2.0
            case .Fighting, .Ground, .Grass:
                return 0.5
            default:
                return 1.0
            }
        case .Ghost:
            switch attacker {
            case .Ghost, .Dark:
                return 2.0
            case .Poison, .Bug:
                return 0.5
            case .Normal, .Fighting:
                return 0.0
            default:
                return 1.0
            }
        case .Steel:
            switch attacker {
            case .Fighting, .Ground, .Fire:
                return 2.0
            case .Normal, .Flying, .Rock, .Bug, .Steel, .Grass, .Psychic, .Ice, .Dragon, .Fairy:
                return 0.5
            case .Poison:
                return 0.0
            default:
                return 1.0
            }
        case .Fire:
            switch attacker {
            case .Ground, .Rock, .Water:
                return 2.0
            case .Bug, .Steel, .Fire, .Grass, .Ice, .Fairy:
                return 0.5
            default:
                return 1.0
            }
        case .Water:
            switch attacker {
            case .Grass, .Electric:
                return 2.0
            case .Steel, .Fire, .Water, .Ice:
                return 0.5
            default:
                return 1.0
            }
        case .Grass:
            switch attacker {
            case .Flying, .Poison, .Bug, .Fire, .Ice:
                return 2.0
            case .Ground, .Water, .Grass, .Electric:
                return 0.5
            default:
                return 1.0
            }
        case .Electric:
            switch attacker {
            case .Ground:
                return 2.0
            case .Flying, .Steel, .Electric:
                return 0.5
            default:
                return 1.0
            }
        case .Psychic:
            switch attacker {
            case .Bug, .Ghost, .Dark:
                return 2.0
            case .Fighting, .Psychic:
                return 0.5
            default:
                return 1.0
            }
        case .Ice:
            switch attacker {
            case .Fighting, .Rock, .Steel, .Fire:
                return 2.0
            case .Ice:
                return 0.5
            default:
                return 1.0
            }
        case .Dragon:
            switch attacker {
            case .Ice, .Dragon, .Fairy:
                return 2.0
            case .Fire, .Water, .Grass, .Electric:
                return 0.5
            default:
                return 1.0
            }
        case .Dark:
            switch attacker {
            case .Fighting, .Bug, .Fairy:
                return 2.0
            case .Ghost, .Dark:
                return 0.5
            case .Psychic:
                return 0.0
            default:
                return 1.0
            }
        case .Fairy:
            switch attacker {
            case .Poison, .Steel:
                return 2.0
            case .Fighting, .Bug, .Dark:
                return 0.5
            case .Dragon:
                return 0.0
            default:
                return 1.0
            }
        }
    }
}

