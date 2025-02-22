//
//  CollectionViewController.swift
//  ejercicioTableCollection
//
//  Created by Diplomado on 29/11/24.
//

import UIKit

class CollectionViewController: UIViewController {
    

    @IBOutlet weak var textFieldAdd: UITextField!
    
    var selection: Int = 4
    @IBOutlet weak var collectionView: UICollectionView!
    var arrayPerros = ["Pitbull", "Maltes", "Doberman"]
    var arrayMotos = ["Kawasaki", "Pulsar", "KTM"]
    var arrayPeliculas = ["3MSC", "Pasajeros", "Interestelar"]
    
    var arrayIamgeMotos = ["kawasaki", "pulsar", "ktm"]
    var arrayImagePeliculas = ["3msc", "pasajeros", "interestelar"]
    var arrayImagePerros = ["pitbull", "maltes", "doberman"]
    
    @IBAction func buttonAdd(_ sender: Any) {
        switch selection{
        case 0:
            if !textFieldAdd.text!.isEmpty {
                arrayPerros.append(textFieldAdd.text!)
                UserDefaults.standard.set(arrayPerros, forKey: "arrayPerros")
                print(arrayPerros)
                textFieldAdd.text = ""
                collectionView.reloadData()
            }
        case 1:
            if !textFieldAdd.text!.isEmpty {
                arrayMotos.append(textFieldAdd.text!)
                print(arrayMotos)
                UserDefaults.standard.set(arrayMotos, forKey: "arrayMotos")
                textFieldAdd.text = ""
                collectionView.reloadData()
            }
        case 2:
            if !textFieldAdd.text!.isEmpty {
                arrayPeliculas.append(textFieldAdd.text!)
                print(arrayPeliculas)
                UserDefaults.standard.set(arrayPeliculas, forKey: "arrayPeliculas")
                textFieldAdd.text = ""
                collectionView.reloadData()
            }
        default :
            print()
       
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cargar los datos guardados, si existen
        if let savedPerros = UserDefaults.standard.stringArray(forKey: "arrayPerros") {
            arrayPerros = savedPerros
        }
        if let savedMotos = UserDefaults.standard.stringArray(forKey: "arrayMotos") {
            arrayMotos = savedMotos
        }
        if let savedPeliculas = UserDefaults.standard.stringArray(forKey: "arrayPeliculas") {
            arrayPeliculas = savedPeliculas
        }

        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()

        // Do any additional setup after loading the view.
    }
}


extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch selection{
        case 0:
            return arrayPerros.count
        case 1:
            return arrayMotos.count
        case 2:
            return arrayPeliculas.count
        default :
            print()
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewControllerCell
        switch selection{
        case 0:
            cell.label.text = arrayPerros[indexPath.row]
            cell.label.textColor = .black
            
            if arrayImagePerros.contains(arrayPerros[indexPath.row].lowercased()){
                cell.image.image = UIImage(named: arrayImagePerros[indexPath.row])
            }else{
                cell.image.image = UIImage(systemName: "dog.fill")
            }
            
        case 1:
            cell.label.text = arrayMotos[indexPath.row]
            cell.label.textColor = .black
            
            if arrayIamgeMotos.contains(arrayMotos[indexPath.row].lowercased()){
                cell.image.image = UIImage(named: arrayIamgeMotos[indexPath.row])
            }else{
                cell.image.image = UIImage(systemName: "motorcycle.fill")
            }
           
        case 2:
            cell.label.text = arrayPeliculas[indexPath.row]
            cell.label.textColor = .black
            
            if arrayImagePeliculas.contains(arrayPeliculas[indexPath.row].lowercased()){
                cell.image.image = UIImage(named: arrayImagePeliculas[indexPath.row])
            }else{
                cell.image.image = UIImage(systemName: "movieclapper.fill")
            }
           
        default:
            print()
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 300)
    }
}

