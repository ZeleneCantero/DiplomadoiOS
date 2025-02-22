//
//  ViewController.swift
//  segundoEjercicioConstrain
//
//  Created by Diplomado on 19/10/24.
//

import UIKit

class LamparaViewController: UIViewController {
    private var isOn = false // Variable para el estado
    
    
    private var customView: LamparaView {
        return view as! LamparaView
    }
    
    override func loadView() {
        view = LamparaView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
//        customView.imageOf.tintColor = .black
//        customView.imageOn.tintColor = .black
        customView.imageOf.isOpaque = false
        customView.imageOn.isHidden = true
        customView.buttonOnOf.addAction(UIAction(handler: onOf(_:)), for: .touchUpInside)
    }

    func onOf(_ sender: UIAction){
        isOn.toggle() //Alterna el estado

        if isOn{
            print("El botón está siendo oprimido")
            view.backgroundColor = .white
            customView.imageOn.isHidden = false
            //cusfocoPrendido.isHidden = false //desaparecerlo
            customView.imageOf.isHidden = true


        }else{
            print("El botón no está siendo oprimido")
            view.backgroundColor = .black
            customView.imageOf.isHidden = false
            customView.imageOn.isHidden = true

        }

    }

}
