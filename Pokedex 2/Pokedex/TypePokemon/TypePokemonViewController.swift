//
//  TypePokemonViewController.swift
//  Pokedex
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 07/12/24.
//

import UIKit

class TypePokemonViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrayTypes = ["Fuego", "Agua", "Planta", "Electrico"]
    var arrayTypesNameImages = ["Fuego", "Agua", "Planta", "Electrico"]
    
    var typeSelect: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()

    }
}

extension TypePokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TypePokemonCollecter
        cell.imageType.image = UIImage(named: arrayTypesNameImages[indexPath.row])
        cell.labelType.text = arrayTypes[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        typeSelect = arrayTypes[indexPath.row]
        print("TYPO DE POKEMON SELECCIONADO", typeSelect)
        // Realizar la transición al InformationPokemonViewController
        performSegue(withIdentifier: "nextScreenTypesPokemon", sender: typeSelect)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextScreenTypesPokemon" {
            // Verificar que el destino sea InfoTypePokemonViewController
            if let destinationVC = segue.destination as? InfoTypePokemonViewController {
                // Pasar los datos al InformationPokemonViewController
                if let pokemonName = sender as? String {
                    destinationVC.typeSelect = typeSelect
                    // Aquí puedes configurar cualquier otro dato necesario en el view controller de destino
                }
            }
        }
    }
}


extension TypePokemonViewController: UICollectionViewDelegateFlowLayout {
    // Tamaño de las celdas en el UICollectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)  // Ajusta el tamaño según lo necesites
    }
}
