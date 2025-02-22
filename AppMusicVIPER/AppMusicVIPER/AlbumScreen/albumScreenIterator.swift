//
//  albumScreenIterator.swift
//  AppMusicVIPER
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 16/11/24.
//

//
//  ArtistScreenIterator.swift
//  AppMusicVIPER
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 16/11/24.
//

protocol albumScreenIteratorProtocol: AnyObject {
    func getAlbum() -> [albumScreenEntity]
}

class albumScreenIterator: albumScreenIteratorProtocol {
    
    func getAlbum() -> [albumScreenEntity] {
        return [

            //Camilo
            albumScreenEntity(imageNameAlbum: ["cuatroAlbum", "misManosAlbum", "siEstoyContigoAlbum" ],
                              labelInfoAlbum: ["El álbum Cuatro de Camilo, lanzado en abril de 2019 bajo Sony Music Latin, fusiona pop latino, música urbana y reguetón con letras románticas. El álbum consagró a Camilo como un talento versátil y destacado en la música latina contemporánea.",
                
                                   "El álbum Mis Manos de Camilo, lanzado en noviembre de 2021 bajo Sony Music Latin, fusiona pop, reguetón y elementos acústicos con temas de amor y autoaceptación.",
                                                                        
                
                                               "El álbum Por Primera Vez de Camilo, lanzado en abril de 2020 bajo Sony Music Latin, combina pop urbano, reguetón y baladas con letras emotivas sobre el amor y la felicidad." ],
                              timeSong: <#String#>,
                              buttonNameSong: ["Gordo", "No se vale", "PLIS", "Una vida pasada",
                                               "Machu Pichu", "Manos de Tijera", "Millones", "Tuyo y mio",
                                               "porPrimeraVez", "El mismo aire", "Favorito", "Si estoy contigo"],
                              favoriteSong: false),
            
            //Carla Morrison
            albumScreenEntity(imageNameAlbum: ["dejenmeLlorarAlbum", "ElrenacimientoAlbum", "mientrasDormiaAlbum" ],
                              labelInfoAlbum: ["El álbum Déjenme Llorar de Carla Morrison, lanzado en 2012, fusiona pop e indie con letras íntimas sobre el amor y la vulnerabilidad.",
                
                            "El álbum El Renacimiento de Carla Morrison, lanzado en 2020, presenta una evolución en su estilo musical hacia un sonido más electrónico y experimental, manteniendo la sensibilidad emocional que caracteriza su música.",
                                                                                    
                            
                                               "El álbum Mientras Dormías de Carla Morrison, es una obra introspectiva que fusiona elementos de pop alternativo y folk, Morrison explora temas de nostalgia, sueños y autodescubrimiento, capturando emociones profundas con su característica voz emotiva."],
                                timeSong: <#String#>,
                                buttonNameSong: [" Duele", "Eres tu", "No quise mirar", "Olvide",
                                                 "Diamantes", "Hacia adentro", "Soñar", "Te perdi",
                                                 "Compartir", "Este momento", "Sigo aqui", "Suciedad"],
                                favoriteSong: false),
                            
            //Humbe
            albumScreenEntity(imageNameAlbum: ["auroraAlbum", "entropiaAlbum", "escenciaAlbum" ],
                              labelInfoAlbum: ["Aurora es el tercer álbum de Humbe, lanzado el 11 de noviembre de 2021. El álbum está dedicado a sus padres y fue escrito en su totalidad por Humbe junto con su hermano.",
                
                            "Entropía es el segundo álbum de estudio del cantautor mexicano Humbe, lanzado en 2021. El álbum está compuesto por 11 canciones y se caracteriza por su estilo pop latino, R&B y synth.",
                                                                                    
                            
                                               "Esencia es el álbum de 2023 del artista regiomontano Humbe, cuyo nombre real es Humberto Rodríguez. El disco explora temas como el amor incondicional, la familia, la seguridad y la evolución."],
                              timeSong: <#String#>,
                                           
                            buttonNameSong: ["Amor de Cine", "Como respirar", "Popular", "Ultimamente",
                                            "El poeta", "Himno", "Roma", "Venite",
                                             "17", "Manada", "Te lo prometo", "Tu valor"],
                            favoriteSong: false),
            
            //Lana del Rey
            albumScreenEntity(imageNameAlbum: ["bornToDieAlbum", "sirensAlbum", "ultraviolenceAlbum" ],
                            labelInfoAlbum: ["Born to Die es el primer álbum de estudio de la cantante y compositora estadounidense Lana Del Rey ​. Lanzado al mercado el 27 de enero de 2012.",
                            
                            "Sirens es un álbum inédito de la cantautora estadounidense Lana Del Rey , escrito y grabado en 2005 y 2006, bajo el seudónimo de May Jailer.",
                                                                                    
                            
                                             "Ultraviolence es el segundo álbum de estudio de Lana Del Rey, lanzado en 2014. Se caracteriza por ser un disco melancólico y romántico."],
                              timeSong: <#String#>,
                                           
                            buttonNameSong: ["Blue Jeans", "Off to the races","Radio", "Video games",
                                             "My Momma", "Next to me", "Try tonight", "Weast Bound",
                                             "Brooklyn Baby", "Cruel Word", "Sad Girl", "Weast Coast"],
                            favoriteSong: false),
                        
            //Rauw Alejandro
            albumScreenEntity(imageNameAlbum: ["afrodisiacoAlbum", "saturnoAlbum", "viceVersaAlbum" ],
                            labelInfoAlbum: ["Afrodisíaco es el tercer disco -primer álbum tras dos mixtapes- del portorriqueño Raúl Alejandro Ocasio Ruiz, dando continuidad a Punto de equilibrio y TrapCake.",
                            
                            "ercer álbum de estudio lleno de colaboraciones y curiosidades sobre la vida del cantante. Uno de sus álbumes más completos, pues el artista, además de grabar 18 tracks para este proyecto",
                                                                                    
                            
                                             "Narra las vicisitudes, la euforia y los sinsabores de esas historias de amor que te cambian la vida para siempre. “Es un disco muy personal”, admite Rauw."],
                              timeSong: <#String#>,
                                           
                              buttonNameSong: ["Dile a el", "Enchule", "Mood", "Reloj",
                                             "Dejau", "Gatas", "Mas de una vez", "Punto 40",
                                             "Aquel Nap zz", "Catorce", "Curame", "Todo de ti"],
                              favoriteSong: false)
        ]
    }
}
