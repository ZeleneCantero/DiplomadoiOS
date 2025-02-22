//
//  ArtistScreenIterator.swift
//  AppMusicVIPER
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 16/11/24.
//

protocol artistScreenIteratorProtocol: AnyObject {
    func getAlbum() -> [artistScreenEntity]
}

class artistScreenIterator: artistScreenIteratorProtocol {
    
    func getAlbum() -> [artistScreenEntity] {
        return [
            //Camilo
            artistScreenEntity(imageNameArtist: "camilo",
                               imageNameAlbum:  ["cuatroAlbum", "misManosAlbum", "siEstoyContigoAlbum"],
                               labelInfoArtist: "Marido de Evaluna Montaner: tiene 27 años, salió del reality Factor X y es el autor del hit Tutu, entre otros temas. Nació en Medellín, Colombia, y teniendo sólo 13 años ganó el reality de canto Factor X",
                               buttonNameAlbum: ["Cuatro", "Mis manos", "Por primera vez"]),
            
            //Carla Morrison
            artistScreenEntity(imageNameArtist: "carlaMorrison",
                               imageNameAlbum: ["dejenmeLlorarAlbum", "ElrenacimientoAlbum", "mientrasDormiaAlbum" ],
                               labelInfoArtist: "Carla Morrison, nacida en Tecate, Baja California, es una cantante cuyo oficio es crear música con pedales con secuencias y loops, junto con su teclado de efectos y guitarra electroacústica.",
                                                 
                               buttonNameAlbum: ["Dejenme Llorar", "El renacimiento", "Mientras tu dormias"]),
            
            //Humbe
             artistScreenEntity(imageNameArtist: "Humbe",
                                imageNameAlbum: ["auroraAlbum", "entropiaAlbum", "escenciaAlbum" ],
                                labelInfoArtist: "Humberto Rodríguez Terrazas (Monterrey, Nuevo León, 11 de noviembre de 2000), conocido como Humbe es un cantante y compositor mexicano. Como intérprete, se especializa en los géneros de pop latino y R&B.",
                                buttonNameAlbum: ["Aurora", "Entropia", "Escencia"]),
            
            //Lana del Rey
            artistScreenEntity(imageNameArtist: "lanaDelRey",
                               imageNameAlbum: ["bornToDieAlbum", "sirensAlbum", "ultraviolenceAlbum" ],
                               labelInfoArtist: "Lana Del Rey es una cantante, compositora, modelo, poeta, productora y actriz estadounidense que se caracteriza por su estilo musical que se inspira en la cultura pop de los años 50 y 60.",
                               
                               buttonNameAlbum: ["Born To Die", "Sirens", "Ultraviolence"]),
            
            //Rauw Alejandro
            artistScreenEntity(imageNameArtist: "rauwAlejandro",
                               imageNameAlbum: ["afrodisiacoAlbum", "saturnoAlbum", "viceVersaAlbum" ],
                               labelInfoArtist: "Rauw Alejandro es un cantante y compositor puertorriqueño de música urbana. Su nombre real es Raúl Alejandro Ocasio Ruiz, y nació el 10 de enero de 1993 en Palma Sola, Canóvanas, Puerto Rico.",
                               
                               buttonNameAlbum: ["Afrodisiaco To Die", "Saturno", "Vice Versa"])
            
           
]
    }
}
