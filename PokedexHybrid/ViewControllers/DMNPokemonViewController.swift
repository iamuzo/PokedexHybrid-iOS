//
//  DMNPokemonViewController.swift
//  PokedexHybrid
//
//  Created by Uzo on 1/28/20.
//  Copyright © 2020 Uzo. All rights reserved.
//

import UIKit

class DMNPokemonViewController: UIViewController {
    
    //Properties
    var pokemon: DMNPokemon? {
        didSet {
            updateViews()
        }
    }

    //OUTLETS
    @IBOutlet weak var dmnPokemonSearchBar: UISearchBar!
    @IBOutlet weak var dmnPokemonNameLabel: UILabel!
    @IBOutlet weak var dmnPokemonIdentifierLabel: UILabel!
    @IBOutlet weak var dmnPokemAbilitesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dmnPokemonSearchBar.delegate = self
    }
    
    func updateViews() {
        print("Loaded")
        guard let pokemon = pokemon else { return }
        
        DispatchQueue.main.async {
            ///recall we are able to avoid the use of !(bang operation) due
            ///to the use of NS_ASSUME_NONNULL_END in the declaration (DMNPokemonController.h)
         self.dmnPokemonNameLabel.text = pokemon.name
            self.dmnPokemonIdentifierLabel.text = "ID: \(pokemon.identifer)"
            self.dmnPokemAbilitesLabel.text = (
                "Abilities: \(pokemon.abilities.joined(separator: ", "))"
            )
        }
    }
    
    
}

extension DMNPokemonViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {return}
        DMNPokemonController.sharedInstance().fetchPokemon(withSearchTerm: searchTerm) { (pokemon)
            in
            self.pokemon = pokemon
        }
    }
}
