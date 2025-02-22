//
//  UbicationFlagsViewController.swift
//  weatherApp
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 08/02/25.
//

//
//Nombre: El nombre de la ubicación se mostrará en el título del navigation bar.
//• País: El nombre del país donde se encuentra la ubicación seleccionada.
//• Hora Local: La fecha se mostrará en formato DD/MM/YYYY y la hora en formato
//HH:MM
//• Última Actualización: La fecha se mostrará en formato DD/MM/YYYY y la hora en
//formato HH:MM
//• Temperatura: Se incluirá un segmented control con las letras "C" y "F". Al cambiar
//entre estas opciones, se mostrará la temperatura en la unidad seleccionada.
//• Día o Noche: Dependiendo de si es de día o de noche, el color de fondo cambiará. Si es
//de día se usará el color #87CEEB, y si es de noche se usará el color #191970.
//• Índice UV: Se deberá mostrar el índice UV al tiempo de la consulta.
//• Mapa: Se deberá mostrar un mapa con las coordenadas que proporciona el servicio, se
//mostrará un mapa con la ubicación del lugar.
//• Icono de clima : se deberá mostrar un icono referente al clima, este se deberá descargar y
//mostrar acorde al clima obtenido al momento de la consulta.
//• Botón de Favorito: Se colocará un botón en el navigation bar con el ícono de una
//estrella. Si la ubicación no es un favorito, el ícono estará sin rellenar; si es un favorito,
//estará relleno (.fill). Al seleccionar el ícono, se agregará o quitará de favoritos según
//corresponda.


import UIKit
import MapKit

class UbicationFlagsViewController: UIViewController {
    
    // MARK: - Properties
    var flags: Flags
    var nameFlags: String
    var idFlag: Int
    var imageButtonFavorite: String = ""
    var locationList: [Location] = []
    var indexSelectTemperature: Int = 0
    private var currentWeatherData: WeatherResponse?
    private let viewModel = FavoriteFlagsViewModel()
    let detailFVM = DetailFlagsViewModel()
    
    // MARK: - UI Components
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        indicator.color = .gray
        return indicator
    }()
    
    lazy var labelNameCountry: UILabel = {
        let labelNameCountry = UILabel()
        labelNameCountry.textAlignment = .center
        labelNameCountry.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        labelNameCountry.textColor = .black
        return labelNameCountry
    }()
    
    lazy var dateLocal: UILabel = {
        let dateCountry = UILabel()
        dateCountry.textAlignment = .center
        dateCountry.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        dateCountry.textColor = .black
        return dateCountry
    }()
    
    lazy var labelLastUpdate: UILabel = {
        let lastUpdate = UILabel()
        lastUpdate.textAlignment = .right
        lastUpdate.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        lastUpdate.textColor = .black
        return lastUpdate
    }()
    
    lazy var segmentedControlerTemperature: UISegmentedControl = {
        let segmentedControlerTemperature = UISegmentedControl(items: ["C", "F"])
        segmentedControlerTemperature.selectedSegmentIndex = 0
        segmentedControlerTemperature.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlerTemperature.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return segmentedControlerTemperature
    }()
    
    lazy var labelTemperature: UILabel = {
        let labelTemperature = UILabel()
        labelTemperature.textAlignment = .center
        labelTemperature.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        labelTemperature.textColor = .black
        return labelTemperature
    }()
    
    lazy var labelIndiceUV: UILabel = {
        let labelIndiceUV = UILabel()
        labelIndiceUV.textAlignment = .center
        labelIndiceUV.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        labelIndiceUV.textColor = .black
        return labelIndiceUV
    }()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.preferredConfiguration = MKHybridMapConfiguration()
        return mapView
    }()
    
    private lazy var imageIconClima: UIImageView = {
        let imageIconeClima = UIImageView()
        imageIconeClima.contentMode = .scaleAspectFill
        imageIconeClima.translatesAutoresizingMaskIntoConstraints = false
        return imageIconeClima
    }()
    
    private lazy var stackHorizontal: UIStackView = {
        let stackHorizontal = UIStackView(arrangedSubviews: [imageIconClima, labelTemperature, labelIndiceUV])
        stackHorizontal.axis = .horizontal
        stackHorizontal.distribution = .fillEqually
        stackHorizontal.spacing = 5
        stackHorizontal.translatesAutoresizingMaskIntoConstraints = false
        return stackHorizontal
    }()
    
    private lazy var stackVertical: UIStackView = {
        let stackVertical = UIStackView(arrangedSubviews: [labelNameCountry, stackVerticalTemperature, stackHorizontal, dateLocal, mapView, labelLastUpdate])
        stackVertical.axis = .vertical
        stackVertical.distribution = .fill
        stackVertical.spacing = 40
        stackVertical.translatesAutoresizingMaskIntoConstraints = false
        return stackVertical
    }()
    
    private lazy var stackVerticalTemperature: UIStackView = {
        let stackVertical = UIStackView(arrangedSubviews: [segmentedControlerTemperature])
        stackVertical.axis = .vertical
        stackVertical.distribution = .fill
        stackVertical.alignment = .center
        stackVertical.translatesAutoresizingMaskIntoConstraints = false
        return stackVertical
    }()
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: - Initialization
    init(flags: Flags) {
        self.flags = flags
        self.nameFlags = flags.name
        self.idFlag = flags.id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameFlags = flags.name
        self.idFlag = flags.id
        
        print("Estás viendo información sobre el país: \(nameFlags)")
        
        let titleLabel = UILabel()
        titleLabel.text = "\(nameFlags)"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.sizeToFit()
        
        navigationItem.titleView = titleLabel
        
        imageButtonFavorite = viewModel.favoriteFlagList.contains(flags) ? "star.fill" : "star"

        
        let button = UIBarButtonItem(image: UIImage(systemName: imageButtonFavorite),
                                     style: .plain,
                                     target: self,
                                     action: #selector(buttonPressFavorite))
        navigationItem.rightBarButtonItem = button
        
        setupUI()
        setupLoadingIndicator()
        fetchWeatherData()
        viewModel.updateView()
        
        print("FAVORITOOOOOOOOOOOS \(viewModel.favoriteFlagList)")
        
        
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackVertical)
        
        NSLayoutConstraint.activate([
            // ScrollView constraints
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // StackView constraints
            stackVertical.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            stackVertical.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16),
            stackVertical.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 16),
            stackVertical.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -16),
            
            // Este constraint es importante para el scroll horizontal
            stackVertical.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            
            mapView.widthAnchor.constraint(equalToConstant: 45),
            mapView.heightAnchor.constraint(equalToConstant: 250),
            
            segmentedControlerTemperature.widthAnchor.constraint(equalTo: stackVertical.widthAnchor, multiplier: 0.2),
        ])
    }
    
    private func setupLoadingIndicator() {
        view.addSubview(loadingIndicator)
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingIndicator.widthAnchor.constraint(equalToConstant: 150),
            loadingIndicator.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    // MARK: - API Methods
    private func apiKey() -> String {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "WeatherAPIKey") as? String else {
            fatalError("API Key 'WeatherAPIKey' missing in Info.plist!")
        }
        return apiKey
    }
    
    private func fetchWeatherData() {
        loadingIndicator.startAnimating() // Inicia el indicador de carga
        stackVertical.isHidden = true // Oculta la UI mientras se carga
        
        let apiKeyString = apiKey()
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKeyString)&q=\(nameFlags)"
        print("urllllllll:", urlString)
        
        guard let url = URL(string: urlString) else {
            loadingIndicator.stopAnimating()
            showError("URL inválida. Por favor, intenta de nuevo.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.loadingIndicator.stopAnimating() // Detiene el indicador de carga
                
                if let error = error {
                    self?.showError("Error de conexión: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    self?.showError("Error: No se recibieron datos")
                    return
                }
                
                do {
                    let weatherData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    self?.currentWeatherData = weatherData
                    self?.stackVertical.isHidden = false // Muestra la UI después de obtener los datos
                    self?.updateUI(with: weatherData)
                } catch {
                    self?.showError("Error al procesar los datos: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
    
    
    
    // MARK: - UI Update
    private func updateUI(with weather: WeatherResponse) {
        labelNameCountry.text = weather.location.region
        dateLocal.text = formatDateTime(weather.location.localtime)
        labelLastUpdate.text = "Last update: \(formatDateTime(weather.current.lastUpdated))"
        updateTemperatureDisplay(weather: weather)
        labelIndiceUV.text = "UV: \(weather.current.uv)"
        
        // Configurar el mapa
        let locationCoordinate = CLLocationCoordinate2D(
            latitude: weather.location.lat,
            longitude: weather.location.lon
        )
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationCoordinate
        mapView.addAnnotation(annotation)
        mapView.setCenter(locationCoordinate, animated: true)
        
        // Actualizar el color de fondo según día/noche
        view.backgroundColor = weather.current.isDay == 1
        ? UIColor(red: 135/255.0, green: 206/255.0, blue: 235/255.0, alpha: 0.5)
        : UIColor(red: 25/255.0, green: 25/255.0, blue: 112/255.0, alpha: 0.5)
        
        // Actualizar icono del clima
        if let iconUrl = URL(string: "https:" +  weather.current.condition.icon) {
            downloadWeatherIcon(from: iconUrl)
        }
    }
    
    private func updateTemperatureDisplay(weather: WeatherResponse) {
        let temperature = indexSelectTemperature == 0 ? weather.current.tempC : weather.current.tempF
        let formattedTemp = String(format: "%.1f", temperature)
        labelTemperature.text = "\(formattedTemp)°"
    }
    
    private func downloadWeatherIcon(from url: URL) {
        loadingIndicator.startAnimating()
        loadingIndicator.isHidden = false
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error downloading image: \(error)")
                    // Aquí podrías manejar el error, por ejemplo, mostrando una imagen de error o un mensaje al usuario
                    self?.showErrorImageWeather("No se pudo cargar la imagen del clima")
                    return
                }
                
                if let data = data {
                    self?.imageIconClima.image = UIImage(data: data)
                    self?.loadingIndicator.stopAnimating()
                    self?.loadingIndicator.isHidden = true
                }
                
                
            }
        }
        
        task.resume()
    }

    
    // MARK: - Helper Methods
    private func formatDateTime(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            return dateFormatter.string(from: date)
        }
        return dateString
    }
    
    private func showError(_ message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Aceptar", style: .default) { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showErrorImageWeather(_ message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Aceptar", style: .default) { [weak self] _ in}
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // MARK: - Action Methods
    @objc private func buttonPressFavorite() {
        if detailFVM.favoriteFlags.contains(flags){
            if let country = detailFVM.favoriteFlags.first(where: { $0.id == idFlag }) {
                print(country)
                detailFVM.deleteFlagFromFavoritesFromUbication(at: country)
                viewModel.updateView()
                
                imageButtonFavorite = "star"
            }else {
            }
        } else{
            detailFVM.addFlagToFavoritesFromUbication(at: flags)
            viewModel.updateView()
            imageButtonFavorite = "star.fill"
        }
        
        // Actualizar la UI del botón de favoritos
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: imageButtonFavorite)
        
        // Actualizar la vista
        viewModel.updateView()
    }
        
        @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
            indexSelectTemperature = sender.selectedSegmentIndex
            if let weather = currentWeatherData {
                updateTemperatureDisplay(weather: weather)
            }
        }
    }
    
