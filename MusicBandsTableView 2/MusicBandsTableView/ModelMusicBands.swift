struct ModelMusicBands {
    var idBand: Int
    var nameBand: String
    var imageBand: String
}

let bands = [
    ModelMusicBands(idBand: 0, nameBand: "Camilo", imageBand: "camilo"),
    ModelMusicBands(idBand: 1, nameBand: "Carla Morrison", imageBand: "carlaMorrison"),
    ModelMusicBands(idBand: 2, nameBand: "Humbe", imageBand: "Humbe"),
    ModelMusicBands(idBand: 3, nameBand: "Lana Del Rey", imageBand: "lanaDelRey"),
    ModelMusicBands(idBand: 4, nameBand: "Rauw Alejandro", imageBand: "rauwAlejandro")
]

struct ModelMusicAlbums {
    var idAlbum: [Int]
    var nameAlbum: [String]
    var year: [String]
    var imageAlbum: [String]
}

let albums = [
    ModelMusicAlbums(idAlbum: [0, 1, 2], nameAlbum: ["Cuatro", "Mis manos", "Por primera vez"], year: ["2019", "2021", "2020"], imageAlbum: ["cuatroAlbum", "misManosAlbum", "porPrimeraVezAlbum"]),
    ModelMusicAlbums(idAlbum: [0, 1, 2], nameAlbum: ["Déjenme llorar", "Mientras tu dormías", "El renacimiento"], year: ["2012", "2020", "2021"], imageAlbum: ["dejenmeLlorarAlbum", "mientrasDormiasAlbum", "ElrenacimientoAlbum"]),
    ModelMusicAlbums(idAlbum: [0, 1, 2], nameAlbum: ["Esencia", "Aurora", "Entropía"], year: ["2023", "2021", "2021"], imageAlbum: ["escenciaAlbum", "auroraAlbum", "entropiaAlbum"]),
    ModelMusicAlbums(idAlbum: [0, 1, 2], nameAlbum: ["Born To Die", "Sirens", "Ultraviolence"], year: ["2012", "2006", "2014"], imageAlbum: ["bornToDieAlbum", "sirensAlbum", "ultraviolenceAlbum"]),
    ModelMusicAlbums(idAlbum: [0, 1, 2], nameAlbum: ["Afrodisíaco", "Saturno", "Vice Versa"], year: ["2021", "2023", "2021"], imageAlbum: ["afrodisiacoAlbum", "saturnoAlbum", "viceVersaAlbum"])
]

struct ModelMusicSongs {
    var nameSong: [[String]]
    var time: [[String]]
    var imageSong: [String]
}

let songs = [
    ModelMusicSongs(
        nameSong: [
            ["Gordo", "No se vale", "PLIS", "Una vida pasada"],
            ["Machu Pichu", "Manos de Tijera", "Millones", "Tuyo y mio"],
            ["porPrimeraVez", "El mismo aire", "Favorito", "Si estoy contigo"]
        ],
        time:[
            ["3:50", "3:11", "3:52", "3:44"],
            ["3:30", "4:27", "3:43", "3:22"],
            ["3:04", "3:10", "3:31", "2:44"]
        ],
        imageSong: ["cuatroAlbum", "misManosAlbum", "porPrimeraVezAlbum"]
    ),
    
    ModelMusicSongs(
        nameSong: [
            ["Duele", "Eres tu", "No quise mirar", "Olvide"],
            ["Compartir", "Este momento", "Sigo aqui", "Suciedad"],
            ["Diamantes", "Hacia adentro", "Soñar", "Te perdi"]
        ],
        time:[
            ["3:25", "3:44", "3:47", "4:44"],
            ["4:24", "3:25", "3:29", "4:09"],
            ["3:18", "3:52", "2:52", "3:38"]
        ],
        imageSong: ["dejenmeLlorarAlbum", "mientrasDormiasAlbum", "ElrenacimientoAlbum"]
    ),
    
    ModelMusicSongs(
        nameSong: [
            ["17", "Manada", "Te lo prometo", "Tu valor"],
            ["Amor de Cine", "Como respirar", "Popular", "Ultimamente"],
            ["El poeta", "Himno", "Roma", "Venite"]
        ],
        time:[
            ["3:40", "4:32", "4:09", "3:01"],
            ["4:31", "3:42", "3:43", "3:57"],
            ["3:20", "3:30", "2:58", "4:02"]
        ],
        imageSong: ["escenciaAlbum", "auroraAlbum", "entropiaAlbum"]
    ),
    
    ModelMusicSongs(
        nameSong: [
            ["Blue Jeans", "Off to the races","Radio", "Video games"],
            ["My Momma", "Next to me", "Try tonight", "Weast Bound"],
            ["Brooklyn Baby", "Cruel Word", "Sad Girl", "Weast Coast"]
        ],
        time:[
            ["4:21", "5:00", "3:35", "4:47"],
            ["3:22", "2:38", "2:07", "4:26"],
            ["5:54", "6:40", "5:18", "4:26"]
        ],
        imageSong: ["bornToDieAlbum", "sirensAlbum", "ultraviolenceAlbum"]
    ),
    
    ModelMusicSongs(
        nameSong: [
            ["Dile a el", "Enchule", "Mood", "Reloj"],
            ["Dejau", "Gatas", "Mas de una vez", "Punto 40"],
            ["Aquel Nap ZzZz", "Catorce", "Curame", "Todo de ti"]
        ],
        time:[
            ["3:54", "3:04", "2:31", "3:48"],
            ["3:02", "3:28", "4:06", "3:34"],
            ["4:56", "3:33", "3:03", "3:32"]
        ],
        imageSong: ["afrodisiacoAlbum", "saturnoAlbum", "viceVersaAlbum"]
    )
]
