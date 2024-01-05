//
//  MovieModel.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import Foundation

class MovieModel: NSObject, Codable {
    let trackId: Int
    let artistName: String
    let trackName: String
    let artworkUrl100: String?
    let longDescription: String
    let currency: String
    let primaryGenreName: String
    let trackPrice: Double
    
    var loved: Bool = false
    var price: String {
        return "\(currency) \(trackPrice)"
    }
    var artworkUrl: String {
        return artworkUrl100.orEmpty.replacingOccurrences(of: "100x100", with: "500x500")
    }
    
    enum CodingKeys: String, CodingKey {
        case trackId, artistName, trackName, artworkUrl100, longDescription, currency, primaryGenreName, trackPrice
    }
}

extension MovieModel {
    
    static func mock() -> [MovieModel] {
        let jsonString = """
        {
            "resultCount": 50,
            "results": [
                {
                    "wrapperType": "track",
                    "kind": "feature-movie",
                    "collectionId": 1676376647,
                    "trackId": 1437031362,
                    "artistName": "Bradley Cooper",
                    "collectionName": "Warner Bros. 100th Movies For Mom 5-Film Bundle",
                    "trackName": "A Star Is Born (2018)",
                    "collectionCensoredName": "A Star is Born 3-Film Collection",
                    "trackCensoredName": "A Star Is Born (2018)",
                    "collectionArtistId": 199257486,
                    "collectionArtistViewUrl": "https://itunes.apple.com/au/artist/warner-bros-entertainment-inc/199257486?uo=4",
                    "collectionViewUrl": "https://itunes.apple.com/au/movie/a-star-is-born-2018/id1437031362?uo=4",
                    "trackViewUrl": "https://itunes.apple.com/au/movie/a-star-is-born-2018/id1437031362?uo=4",
                    "previewUrl": "https://video-ssl.itunes.apple.com/itunes-assets/Video128/v4/6b/cd/60/6bcd60b0-73ce-1a9e-1bf8-d7bcc8d32c10/mzvf_2708740245690387686.640x356.h264lc.U.p.m4v",
                    "artworkUrl30": "https://is1-ssl.mzstatic.com/image/thumb/Video115/v4/a2/26/fd/a226fd77-c80b-5ee7-e40f-6a0222e1645d/pr_source.jpg/30x30bb.jpg",
                    "artworkUrl60": "https://is1-ssl.mzstatic.com/image/thumb/Video115/v4/a2/26/fd/a226fd77-c80b-5ee7-e40f-6a0222e1645d/pr_source.jpg/60x60bb.jpg",
                    "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Video115/v4/a2/26/fd/a226fd77-c80b-5ee7-e40f-6a0222e1645d/pr_source.jpg/100x100bb.jpg",
                    "collectionPrice": 7.99,
                    "trackPrice": 7.99,
                    "trackRentalPrice": 4.99,
                    "collectionHdPrice": 7.99,
                    "trackHdPrice": 7.99,
                    "trackHdRentalPrice": 4.99,
                    "releaseDate": "2018-10-18T07:00:00Z",
                    "collectionExplicitness": "notExplicit",
                    "trackExplicitness": "notExplicit",
                    "trackCount": 5,
                    "trackNumber": 2,
                    "trackTimeMillis": 8148723,
                    "country": "AUS",
                    "currency": "AUD",
                    "primaryGenreName": "Romance",
                    "contentAdvisoryRating": "M",
                    "shortDescription": "Seasoned musician Jackson Maine (Bradley Cooper) discovers—and falls in love with—struggling artist",
                    "longDescription": "Seasoned musician Jackson Maine (Bradley Cooper) discovers—and falls in love with—struggling artist Ally (Lady Gaga). She has just about given up on her dream to make it big as a singer… until Jack coaxes her into the spotlight. But even as Ally’s career takes off, the personal side of their relationship is breaking down, as Jack fights an ongoing battle with his own internal demons.",
                    "hasITunesExtras": true
                },
                {
                    "wrapperType": "track",
                    "kind": "feature-movie",
                    "collectionId": 982641672,
                    "trackId": 978943481,
                    "artistName": "George Lucas",
                    "collectionName": "Star Wars: The Digital Movie Collection",
                    "trackName": "Star Wars: A New Hope",
                    "collectionCensoredName": "Star Wars: The Digital Movie Collection",
                    "trackCensoredName": "Star Wars: A New Hope",
                    "collectionArtistId": 410641764,
                    "collectionArtistViewUrl": "https://itunes.apple.com/au/artist/buena-vista-home-entertainment-inc/410641764?uo=4",
                    "collectionViewUrl": "https://itunes.apple.com/au/movie/star-wars-a-new-hope/id978943481?uo=4",
                    "trackViewUrl": "https://itunes.apple.com/au/movie/star-wars-a-new-hope/id978943481?uo=4",
                    "previewUrl": "https://video-ssl.itunes.apple.com/itunes-assets/Video122/v4/0d/37/b8/0d37b859-55b4-2ed3-02d2-e7a7ae8359c6/mzvf_842097924938904897.640x362.h264lc.U.p.m4v",
                    "artworkUrl30": "https://is1-ssl.mzstatic.com/image/thumb/Video113/v4/58/7f/97/587f97b3-1919-11f2-43c8-bbe89e68f3fc/pr_source.lsr/30x30bb.jpg",
                    "artworkUrl60": "https://is1-ssl.mzstatic.com/image/thumb/Video113/v4/58/7f/97/587f97b3-1919-11f2-43c8-bbe89e68f3fc/pr_source.lsr/60x60bb.jpg",
                    "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Video113/v4/58/7f/97/587f97b3-1919-11f2-43c8-bbe89e68f3fc/pr_source.lsr/100x100bb.jpg",
                    "collectionPrice": 18.99,
                    "trackPrice": 18.99,
                    "collectionHdPrice": 19.99,
                    "trackHdPrice": 19.99,
                    "releaseDate": "1977-05-25T07:00:00Z",
                    "collectionExplicitness": "notExplicit",
                    "trackExplicitness": "notExplicit",
                    "discCount": 1,
                    "discNumber": 1,
                    "trackCount": 6,
                    "trackNumber": 4,
                    "trackTimeMillis": 7492608,
                    "country": "AUS",
                    "currency": "AUD",
                    "primaryGenreName": "Action & Adventure",
                    "contentAdvisoryRating": "PG",
                    "longDescription": "Luke Skywalker begins a journey that will change the galaxy in Star Wars: Episode IV -  A New Hope. Nineteen years after the formation of the Empire, Luke is thrust into the struggle of the Rebel Alliance when he meets Obi-Wan Kenobi, who has lived for years in seclusion on the desert planet of Tatooine. Obi-Wan begins Luke’s Jedi training as Luke joins him on a daring mission to rescue the beautiful Rebel leader Princess Leia from the clutches of Darth Vader and the evil Empire.",
                    "hasITunesExtras": true
                },
                {
                    "wrapperType": "track",
                    "kind": "feature-movie",
                    "collectionId": 982641672,
                    "trackId": 975080816,
                    "artistName": "George Lucas",
                    "collectionName": "Star Wars: The Digital Movie Collection",
                    "trackName": "Star Wars: The Phantom Menace",
                    "collectionCensoredName": "Star Wars: The Digital Movie Collection",
                    "trackCensoredName": "Star Wars: The Phantom Menace",
                    "collectionArtistId": 410641764,
                    "collectionArtistViewUrl": "https://itunes.apple.com/au/artist/buena-vista-home-entertainment-inc/410641764?uo=4",
                    "collectionViewUrl": "https://itunes.apple.com/au/movie/star-wars-the-phantom-menace/id975080816?uo=4",
                    "trackViewUrl": "https://itunes.apple.com/au/movie/star-wars-the-phantom-menace/id975080816?uo=4",
                    "previewUrl": "https://video-ssl.itunes.apple.com/itunes-assets/Video113/v4/4c/88/67/4c8867ee-f781-cc02-fd72-972a1d11ac7e/mzvf_4694524656895114499.640x360.h264lc.U.p.m4v",
                    "artworkUrl30": "https://is1-ssl.mzstatic.com/image/thumb/Video123/v4/18/98/ce/1898cea4-56a5-0542-c115-f1057ed45fea/pr_source.lsr/30x30bb.jpg",
                    "artworkUrl60": "https://is1-ssl.mzstatic.com/image/thumb/Video123/v4/18/98/ce/1898cea4-56a5-0542-c115-f1057ed45fea/pr_source.lsr/60x60bb.jpg",
                    "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Video123/v4/18/98/ce/1898cea4-56a5-0542-c115-f1057ed45fea/pr_source.lsr/100x100bb.jpg",
                    "collectionPrice": 18.99,
                    "trackPrice": 18.99,
                    "collectionHdPrice": 19.99,
                    "trackHdPrice": 19.99,
                    "releaseDate": "1999-05-19T07:00:00Z",
                    "collectionExplicitness": "notExplicit",
                    "trackExplicitness": "notExplicit",
                    "discCount": 1,
                    "discNumber": 1,
                    "trackCount": 6,
                    "trackNumber": 1,
                    "trackTimeMillis": 8180628,
                    "country": "AUS",
                    "currency": "AUD",
                    "primaryGenreName": "Action & Adventure",
                    "contentAdvisoryRating": "PG",
                    "shortDescription": "For the first time ever on digital, experience the heroic action and unforgettable adventures of",
                    "longDescription": "Experience the heroic action and unforgettable adventures of Star Wars: Episode I - The Phantom Menace.  See the first fateful steps in the journey of Anakin Skywalker. Stranded on the desert planet Tatooine after rescuing young Queen Amidala from the impending invasion of Naboo, Jedi apprentice Obi-Wan Kenobi and his Jedi Master Qui-Gon Jinn discover nine-year-old Anakin, a young slave unusually strong in the Force. Anakin wins a thrilling Podrace and with it his freedom as he leaves his home to be trained as a Jedi. The heroes return to Naboo where Anakin and the Queen face massive invasion forces while the two Jedi contend with a deadly foe named Darth Maul. Only then do they realize the invasion is merely the first step in a sinister scheme by the re-emergent forces of darkness known as the Sith.",
                    "hasITunesExtras": true
                },
                {
                    "wrapperType": "track",
                    "kind": "feature-movie",
                    "collectionId": 1502346977,
                    "trackId": 1063466898,
                    "artistName": "J.J. Abrams",
                    "collectionName": "Star Wars: The Skywalker Saga 9-Movie Collection",
                    "trackName": "Star Wars: The Force Awakens",
                    "collectionCensoredName": "Star Wars: The Skywalker Saga 9-Movie Collection",
                    "trackCensoredName": "Star Wars: The Force Awakens",
                    "collectionArtistId": 410641764,
                    "collectionArtistViewUrl": "https://itunes.apple.com/au/artist/buena-vista-home-entertainment-inc/410641764?uo=4",
                    "collectionViewUrl": "https://itunes.apple.com/au/movie/star-wars-the-force-awakens/id1063466898?uo=4",
                    "trackViewUrl": "https://itunes.apple.com/au/movie/star-wars-the-force-awakens/id1063466898?uo=4",
                    "previewUrl": "https://video-ssl.itunes.apple.com/itunes-assets/Video82/v4/a3/ef/25/a3ef253a-208e-3cbc-cbf0-bc444dae2f8d/mzvf_6313901593442783545.640x354.h264lc.U.p.m4v",
                    "artworkUrl30": "https://is1-ssl.mzstatic.com/image/thumb/Video123/v4/1f/2b/ae/1f2bae7f-62a1-1055-8471-401291b6dcdd/pr_source.lsr/30x30bb.jpg",
                    "artworkUrl60": "https://is1-ssl.mzstatic.com/image/thumb/Video123/v4/1f/2b/ae/1f2bae7f-62a1-1055-8471-401291b6dcdd/pr_source.lsr/60x60bb.jpg",
                    "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Video123/v4/1f/2b/ae/1f2bae7f-62a1-1055-8471-401291b6dcdd/pr_source.lsr/100x100bb.jpg",
                    "collectionPrice": 19.99,
                    "trackPrice": 19.99,
                    "collectionHdPrice": 24.99,
                    "trackHdPrice": 24.99,
                    "releaseDate": "2015-12-18T08:00:00Z",
                    "collectionExplicitness": "notExplicit",
                    "trackExplicitness": "notExplicit",
                    "discCount": 1,
                    "discNumber": 1,
                    "trackCount": 9,
                    "trackNumber": 7,
                    "trackTimeMillis": 8302127,
                    "country": "AUS",
                    "currency": "AUD",
                    "primaryGenreName": "Action & Adventure",
                    "contentAdvisoryRating": "M",
                    "shortDescription": "Lucasfilm and visionary director J.J. Abrams join forces to take you back again to a galaxy far, far",
                    "longDescription": "Visionary director J.J. Abrams brings to life the motion picture event of a generation. As Kylo Ren and the sinister First Order rise from the ashes of the Empire, Luke Skywalker is missing when the galaxy needs him most. It's up to Rey, a desert scavenger, and Finn, a defecting stormtrooper, to join forces with Han Solo and Chewbacca in a desperate search for the one hope of restoring peace to the galaxy.",
                    "hasITunesExtras": true
                },
                {
                    "wrapperType": "track",
                    "kind": "feature-movie",
                    "collectionId": 1066900798,
                    "trackId": 975793398,
                    "artistName": "Irvin Kershner",
                    "collectionName": "星際大戰6部曲",
                    "trackName": "Star Wars: The Empire Strikes Back",
                    "collectionCensoredName": "星際大戰6部曲",
                    "trackCensoredName": "Star Wars: The Empire Strikes Back",
                    "collectionArtistId": 410641764,
                    "collectionArtistViewUrl": "https://itunes.apple.com/au/artist/buena-vista-home-entertainment-inc/410641764?uo=4",
                    "collectionViewUrl": "https://itunes.apple.com/au/movie/star-wars-the-empire-strikes-back/id975793398?uo=4",
                    "trackViewUrl": "https://itunes.apple.com/au/movie/star-wars-the-empire-strikes-back/id975793398?uo=4",
                    "previewUrl": "https://video-ssl.itunes.apple.com/itunes-assets/Video123/v4/48/b7/d4/48b7d464-c053-ada4-3ab5-df377005a8ae/mzvf_4839677935584511804.640x362.h264lc.U.p.m4v",
                    "artworkUrl30": "https://is1-ssl.mzstatic.com/image/thumb/Video123/v4/01/3a/f1/013af151-fe2a-df00-f8cf-1f4603cbe52f/pr_source.lsr/30x30bb.jpg",
                    "artworkUrl60": "https://is1-ssl.mzstatic.com/image/thumb/Video123/v4/01/3a/f1/013af151-fe2a-df00-f8cf-1f4603cbe52f/pr_source.lsr/60x60bb.jpg",
                    "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Video123/v4/01/3a/f1/013af151-fe2a-df00-f8cf-1f4603cbe52f/pr_source.lsr/100x100bb.jpg",
                    "collectionPrice": 18.99,
                    "trackPrice": 18.99,
                    "collectionHdPrice": 19.99,
                    "trackHdPrice": 19.99,
                    "releaseDate": "1980-06-20T07:00:00Z",
                    "collectionExplicitness": "notExplicit",
                    "trackExplicitness": "notExplicit",
                    "discCount": 1,
                    "discNumber": 1,
                    "trackCount": 6,
                    "trackNumber": 6,
                    "trackTimeMillis": 7651183,
                    "country": "AUS",
                    "currency": "AUD",
                    "primaryGenreName": "Action & Adventure",
                    "contentAdvisoryRating": "PG",
                    "longDescription": "Discover the conflict between good and evil in the electrifying Star Wars: Episode V - The Empire Strikes Back. After the destruction of the Death Star, Imperial forces continue to pursue the Rebels. After the Rebellion’s defeat on the ice planet Hoth, Luke journeys to the planet Dagobah to train with Jedi Master Yoda, who has lived in hiding since the fall of the Republic. In an attempt to convert Luke to the dark side, Darth Vader lures young Skywalker into a trap in the Cloud City of Bespin.",
                    "hasITunesExtras": true
                },
                {
                    "wrapperType": "track",
                    "kind": "feature-movie",
                    "collectionId": 1502346977,
                    "trackId": 1316280891,
                    "artistName": "Rian Johnson",
                    "collectionName": "Star Wars: The Skywalker Saga 9-Movie Collection",
                    "trackName": "Star Wars: The Last Jedi",
                    "collectionCensoredName": "Star Wars: The Skywalker Saga 9-Movie Collection",
                    "trackCensoredName": "Star Wars: The Last Jedi",
                    "collectionArtistId": 410641764,
                    "collectionArtistViewUrl": "https://itunes.apple.com/au/artist/buena-vista-home-entertainment-inc/410641764?uo=4",
                    "collectionViewUrl": "https://itunes.apple.com/au/movie/star-wars-the-last-jedi/id1316280891?uo=4",
                    "trackViewUrl": "https://itunes.apple.com/au/movie/star-wars-the-last-jedi/id1316280891?uo=4",
                    "previewUrl": "https://video-ssl.itunes.apple.com/itunes-assets/Video118/v4/33/32/8c/33328c8f-0729-664c-e969-4d6a18f40b32/mzvf_2938194234974585940.640x356.h264lc.U.p.m4v",
                    "artworkUrl30": "https://is1-ssl.mzstatic.com/image/thumb/Video123/v4/d7/26/75/d72675bb-f448-3a37-91cd-dd58a6927107/pr_source.lsr/30x30bb.jpg",
                    "artworkUrl60": "https://is1-ssl.mzstatic.com/image/thumb/Video123/v4/d7/26/75/d72675bb-f448-3a37-91cd-dd58a6927107/pr_source.lsr/60x60bb.jpg",
                    "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Video123/v4/d7/26/75/d72675bb-f448-3a37-91cd-dd58a6927107/pr_source.lsr/100x100bb.jpg",
                    "collectionPrice": 19.99,
                    "trackPrice": 19.99,
                    "collectionHdPrice": 24.99,
                    "trackHdPrice": 24.99,
                    "releaseDate": "2017-12-15T08:00:00Z",
                    "collectionExplicitness": "notExplicit",
                    "trackExplicitness": "notExplicit",
                    "discCount": 1,
                    "discNumber": 1,
                    "trackCount": 9,
                    "trackNumber": 8,
                    "trackTimeMillis": 9125948,
                    "country": "AUS",
                    "currency": "AUD",
                    "primaryGenreName": "Action & Adventure",
                    "contentAdvisoryRating": "M",
                    "shortDescription": "In Lucasfilm’s Star Wars: The Last Jedi, the Skywalker saga continues as the heroes of The Force",
                    "longDescription": "In Lucasfilm’s Star Wars: The Last Jedi, the Skywalker saga continues as the heroes of The Force Awakens join the galactic legends in an epic adventure that unlocks new mysteries of the Force and shocking revelations of the past.",
                    "hasITunesExtras": true
                },
                {
                    "wrapperType": "track",
                    "kind": "feature-movie",
                    "collectionId": 1159162733,
                    "trackId": 1128456722,
                    "artistName": "Justin Lin",
                    "collectionName": "Star Trek 3-Movie Collection",
                    "trackName": "Star Trek Beyond",
                    "collectionCensoredName": "Star Trek 3-Movie Collection",
                    "trackCensoredName": "Star Trek Beyond",
                    "collectionArtistId": 1008915738,
                    "collectionArtistViewUrl": "https://itunes.apple.com/au/artist/paramount-home-entertainment-inc/1008915738?uo=4",
                    "collectionViewUrl": "https://itunes.apple.com/au/movie/star-trek-beyond/id1128456722?uo=4",
                    "trackViewUrl": "https://itunes.apple.com/au/movie/star-trek-beyond/id1128456722?uo=4",
                    "previewUrl": "https://video-ssl.itunes.apple.com/itunes-assets/Video117/v4/b8/04/88/b80488ca-b417-22ff-716f-b9cefcc83e9b/mzvf_1928163976590105292.640x354.h264lc.U.p.m4v",
                    "artworkUrl30": "https://is1-ssl.mzstatic.com/image/thumb/Video42/v4/16/8f/78/168f786c-4e98-e44c-bb73-b09b14fd6b24/pr_source.lsr/30x30bb.jpg",
                    "artworkUrl60": "https://is1-ssl.mzstatic.com/image/thumb/Video42/v4/16/8f/78/168f786c-4e98-e44c-bb73-b09b14fd6b24/pr_source.lsr/60x60bb.jpg",
                    "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Video42/v4/16/8f/78/168f786c-4e98-e44c-bb73-b09b14fd6b24/pr_source.lsr/100x100bb.jpg",
                    "collectionPrice": 7.99,
                    "trackPrice": 7.99,
                    "trackRentalPrice": 2.99,
                    "collectionHdPrice": 7.99,
                    "trackHdPrice": 7.99,
                    "trackHdRentalPrice": 2.99,
                    "releaseDate": "2016-07-22T07:00:00Z",
                    "collectionExplicitness": "notExplicit",
                    "trackExplicitness": "notExplicit",
                    "discCount": 1,
                    "discNumber": 1,
                    "trackCount": 3,
                    "trackNumber": 3,
                    "trackTimeMillis": 7354310,
                    "country": "AUS",
                    "currency": "AUD",
                    "primaryGenreName": "Sci-Fi & Fantasy",
                    "contentAdvisoryRating": "M",
                    "shortDescription": "From Director Justin Lin (FAST AND FURIOUS) and Producer J.J. Abrams comes the third action-packed",
                    "longDescription": "From Director Justin Lin (FAST AND FURIOUS) and Producer J.J. Abrams comes the third action-packed adventure of the USS Enterprise, following STAR TREK and STAR TREK INTO DARKNESS. Dispatched on a rescue mission to the farthest reaches of space, a ruthless enemy named Krall has attacked. Crash-landing on an uncharted hostile world, Captain Kirk, Spock and the crew are separated with no means of escape. Only Jaylah, a rebellious alien warrior, can help them reunite and find a way off the planet in a race against time to stop Krall’s deadly army from triggering all-out galactic war.",
                    "hasITunesExtras": true
                }
            ]
        }
        """.toJsonData()
        
        return jsonString.toObject(ResponseResult<[MovieModel]>.self)!.results
    }
    
}
