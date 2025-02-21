////
////  MusicController.swift
////  AppMusicProgramatico
////
////  Created by Diplomado on 23/10/24.
////
//
//import UIKit
//
//class MusicViewController: UIViewController {
//
//        var tagMusic: Int = 3
//
////        @IBOutlet weak var titleMusic: UILabel!
////        @IBOutlet weak var artistMusic: UILabel!
////        @IBOutlet weak var albumMusic: UIImageView!
////        @IBOutlet weak var timeMusic: UILabel!
////        @IBOutlet weak var timeMusicFinal: UILabel!
////        @IBOutlet weak var sliderTime: UISlider!
////        @IBOutlet weak var playPause: UIButton!
////        @IBOutlet weak var backSong: UIButton!
////        @IBOutlet weak var nextSong: UIButton!
//
//        var songIndex: Int = 0
//        var timer: Timer?
//
//        // Arreglo de canciones
//        let songs: [AppMusicModel] = [song0, song1, song2]
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            playPause.setImage(UIImage(systemName: "play.circle"), for: .normal)
//            playPause.tintColor = .systemPink
//            backSong.setImage(UIImage(systemName: "backward.fill"), for: .normal)
//            backSong.tintColor = .systemPink
//            nextSong.setImage(UIImage(systemName: "forward.fill"), for: .normal)
//            nextSong.tintColor = .systemPink
//            updateUI()
//            startSliderTimer()
//        }
//
//        func updateUI() {
//
//            let currentSong = songs[songIndex]
//            titleMusic.text = currentSong.title
//            artistMusic.text = currentSong.artist
//            albumMusic.image = currentSong.album
//            timeMusicFinal.text = currentSong.timeText
//            sliderTime.value = 0
//            sliderTime.maximumValue = Float(currentSong.timeD ?? 0)
//            updateLabelWithSliderValue() // Para inicializar el tiempo
//        }
//
//        @IBAction func backSong(_ sender: UIButton) {
//            songIndex = (songIndex - 1 + songs.count) % songs.count
//            updateUI()
//        }
//
//        @IBAction func nextSong(_ sender: UIButton) {
//            songIndex = (songIndex + 1) % songs.count
//            updateUI()
//        }
//
//        @IBAction func pausaPlay(_ sender: UIButton) {
//            if sender.isSelected {
//                sender.isSelected = false
//                sender.setImage(UIImage(systemName: "play.circle"), for: .normal)
//                startSliderTimer()
//            } else {
//                sender.isSelected = true
//                sender.setImage(UIImage(systemName: "pause.circle"), for: .normal)
//                print("Se detiene")
//                timer?.invalidate()
//            }
//        }
//
//        func startSliderTimer() {
//            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
//                guard let self = self else { return }
//                if self.sliderTime.value < self.sliderTime.maximumValue {
//                    self.sliderTime.value += 1
//                    self.updateLabelWithSliderValue()
//                } else {
//                    self.timer?.invalidate()
//                }
//            }
//        }
//
//        func updateLabelWithSliderValue() {
//            let totalSeconds = Int(sliderTime.value)
//            let minutes = totalSeconds / 60
//            let seconds = totalSeconds % 60
//            timeMusic.text = String(format: "%d:%02d", minutes, seconds)
//        }
//
//        deinit {
//            timer?.invalidate()
//        }
//}
//
//
