////
////  UbicationFlagsViewController.swift
////  weatherApp
////
////  Created by Zelene Yosseline Isayana Montes Cantero on 08/02/25.
////
//
////
////Nombre: El nombre de la ubicación se mostrará en el título del navigation bar.
////• País: El nombre del país donde se encuentra la ubicación seleccionada.
////• Hora Local: La fecha se mostrará en formato DD/MM/YYYY y la hora en formato
////HH:MM
////• Última Actualización: La fecha se mostrará en formato DD/MM/YYYY y la hora en
////formato HH:MM
////• Temperatura: Se incluirá un segmented control con las letras "C" y "F". Al cambiar
////entre estas opciones, se mostrará la temperatura en la unidad seleccionada.
////• Día o Noche: Dependiendo de si es de día o de noche, el color de fondo cambiará. Si es
////de día se usará el color #87CEEB, y si es de noche se usará el color #191970.
////• Índice UV: Se deberá mostrar el índice UV al tiempo de la consulta.
////• Mapa: Se deberá mostrar un mapa con las coordenadas que proporciona el servicio, se
////mostrará un mapa con la ubicación del lugar.
////• Icono de clima : se deberá mostrar un icono referente al clima, este se deberá descargar y
////mostrar acorde al clima obtenido al momento de la consulta.
////• Botón de Favorito: Se colocará un botón en el navigation bar con el ícono de una
////estrella. Si la ubicación no es un favorito, el ícono estará sin rellenar; si es un favorito,
////estará relleno (.fill). Al seleccionar el ícono, se agregará o quitará de favoritos según
////corresponda.
//
//
//import UIKit
//import MapKit
//
//class UbicationFlagsViewController: UIViewController {
//    
//    var nameCountry: Flags
//    var countryFavoriteBool: Bool = false
//    var imageButtonFavorite: String = ""
//    var locationList: [Location] = []
//    
//    //• País: El nombre del país donde se encuentra la ubicación seleccionada.
//    lazy var labelNameCountry: UILabel = {
//        let labelNameCountry = UILabel()
//        labelNameCountry.textAlignment = .center
//        labelNameCountry.text = "City of London, Greater London"
//        labelNameCountry.font = UIFont.systemFont(ofSize: 25, weight: .bold)
//        labelNameCountry.textColor = .black
//        return labelNameCountry
//    }()
//    
//    //• Hora Local: La fecha se mostrará en formato DD/MM/YYYY y la hora en formato
//    lazy var dateLocal: UILabel = {
//        //HH:MM
//        let dateCountry = UILabel()
//        dateCountry.textAlignment = .center
//        dateCountry.text = "01/08/2024 17:12"
//        dateCountry.font = UIFont.systemFont(ofSize: 15, weight: .regular)
//        dateCountry.textColor = .black
//        return dateCountry
//    }()
//    
//    //• Última Actualización: La fecha se mostrará en formato DD/MM/YYYY y la hora en
//    lazy var labelLastUpdate: UILabel = {
//        //formato HH:MM
//        let lastUpdate = UILabel()
//        lastUpdate.textAlignment = .right
//        lastUpdate.text = "Last update: 01/08/2024 17:12"
//        lastUpdate.font = UIFont.systemFont(ofSize: 15, weight: .regular)
//        lastUpdate.textColor = .black
//        return lastUpdate
//    }()
//    
//    //• Temperatura: Se incluirá un segmented control con las letras "C" y "F". Al cambiar
//    //entre estas opciones, se mostrará la temperatura en la unidad seleccionada.
//    lazy var segmentedControlerTemperature: UISegmentedControl
//    = {
//        let segmentedControlerTemperature = UISegmentedControl(items: ["C", "F"])
//        segmentedControlerTemperature.selectedSegmentIndex = 0
//        segmentedControlerTemperature.translatesAutoresizingMaskIntoConstraints = false
//        return segmentedControlerTemperature
//    }()
//    
//    //• Temperatura: Se incluirá un segmented control con las letras "C" y "F". Al cambiar
//    //entre estas opciones, se mostrará la temperatura en la unidad seleccionada.
//    lazy var labelTemperature: UILabel = {
//        var labelTemperature = UILabel()
//        labelTemperature.textAlignment = .center
//        labelTemperature.text = "17°"
//        labelTemperature.font = UIFont.systemFont(ofSize: 60, weight: .bold)
//        labelTemperature.textColor = .black
//        return labelTemperature
//    }()
//    
//    //• Índice UV: Se deberá mostrar el índice UV al tiempo de la consulta.
//    lazy var labelIndiceUV: UILabel = {
//        labelIndiceUV = UILabel()
//        labelIndiceUV.textAlignment = .center
//        labelIndiceUV.text = "UV: 1.0"
//        labelIndiceUV.font = UIFont.systemFont(ofSize: 20, weight: .regular)
//        labelIndiceUV.textColor = .black
//        return labelIndiceUV
//    }()
//    
//    //• Mapa: Se deberá mostrar un mapa con las coordenadas que proporciona el servicio, se
//    //mostrará un mapa con la ubicación del lugar.
//    private lazy var mapView: MKMapView = {
//        let mapView = MKMapView()
//        mapView.translatesAutoresizingMaskIntoConstraints = false
//        mapView.preferredConfiguration = MKHybridMapConfiguration()
//        return mapView
//    }()
//    
//    //• Icono de clima : se deberá mostrar un icono referente al clima, este se deberá descargar y
//    //mostrar acorde al clima obtenido al momento de la consulta.
//    private lazy var imageIconClima: UIImageView = {
//        let imageIconeClima = UIImageView()
//        imageIconeClima.contentMode = .scaleAspectFill
//        imageIconeClima.image = UIImage(systemName: "sun.horizon")
//        imageIconeClima.translatesAutoresizingMaskIntoConstraints = false
//        return imageIconeClima
//    }()
//    
//    //Stack horizontal
//    private lazy var stackHorizontal: UIStackView = {
//        let stackHorizontal = UIStackView(arrangedSubviews: [imageIconClima, labelTemperature, labelIndiceUV])
//        stackHorizontal.axis = .horizontal
//        stackHorizontal.distribution = .fillEqually
//        stackHorizontal.spacing = 15
//        stackHorizontal.translatesAutoresizingMaskIntoConstraints = false
//        return stackHorizontal
//    }()
//    
//    //Stack vertical
//    private lazy var stackVertical: UIStackView = {
//        let stackVertical = UIStackView(arrangedSubviews: [labelNameCountry, segmentedControlerTemperature, stackHorizontal, dateLocal, mapView, labelLastUpdate])
//        stackVertical.axis = .vertical
//        stackVertical.distribution = .fill
//        stackVertical.spacing = 30
//        stackVertical.translatesAutoresizingMaskIntoConstraints = false
//        return stackVertical
//    }()
//
//    init(nameCountry: Flags, countryFavoriteBool: Bool) {
//        self.nameCountry = nameCountry
//        self.countryFavoriteBool = countryFavoriteBool
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    // ScrollView
//    private lazy var scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        return scrollView
//    }()
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("Estás viendo información sobre el país: \(nameCountry)")
//        
//        //Nombre: El nombre de la ubicación se mostrará en el título del navigation bar.
//        let titleLabel = UILabel()
//        titleLabel.text = "\(nameCountry.name)"
//        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        titleLabel.textAlignment = .center
//        titleLabel.sizeToFit()
//
//        self.navigationItem.titleView = titleLabel
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        
//        //• Botón de Favorito: Se colocará un botón en el navigation bar con el ícono de una
//        //estrella. Si la ubicación no es un favorito, el ícono estará sin rellenar; si es un favorito,
//        //estará relleno (.fill). Al seleccionar el ícono, se agregará o quitará de favoritos según
//        //corresponda.
//
//        imageButtonFavorite = countryFavoriteBool ? "star.fill" : "star"
//            
//        let button = UIBarButtonItem(image: UIImage(systemName: imageButtonFavorite),
//                                     style: .plain,
//                                     target: self,
//                                     action: #selector(buttonPressFavorite))
//        navigationItem.rightBarButtonItem = button
//        setupUI()
//        
//        
//        //API
//        URLApi()
//
//        
//    }
//    
//    @objc private func buttonPressFavorite() {
//        print("Has presionado el botón de favoritos")
//    }
//    
//    func apiKey() -> String {
//        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "WeatherAPIKey") as? String else {
//            fatalError("API Key 'WeatherAPIKey' missing in Info.plist!")
//        }
//        return apiKey
//    }
//
//    
//    func URLApi() {
//        let apiKeyString = apiKey()
//        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKeyString)&q=\(nameCountry.name)"
//        print(urlString)
//        
//        if let url = URL(string: urlString) {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    print("Error en la solicitud HTTP:", error.localizedDescription)
//                    return
//                }
//                
//                guard let data = data else {
//                    print("No se recibieron datos")
//                    return
//                }
//                
//                // Aquí puedes procesar los datos recibidos (parsearlos, mostrar en la interfaz, etc.)
//                do {
//                    let weatherData = try JSONDecoder().decode(WeatherResponse.self, from: data)
////                    print("NOMBRE SACADO DE LA API", weatherData.location.localtimeEpoch)
//                    
//                } catch {
//                    print("Error al decodificar JSON:", error.localizedDescription)
//                }
//            }.resume()
//        } else {
//            print("URL inválida")
//        }
//    }
//
//    
//    private func setupUI() {
//        view.addSubview(scrollView)
//        scrollView.addSubview(stackVertical)
//        
//        NSLayoutConstraint.activate([
//            
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            
//            stackVertical.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            stackVertical.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            stackVertical.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -16),
//            stackVertical.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -105),
//        ])
//    }
//    
//    
//}
