# PlantSnap
latihan membuat mobile app dengan SwiftUI pemula

PlantSnap merupakan app berfungsi untuk mengeksplorasi tentang tumbuhan, berdasarkan data-data botani (spesies, panduan perawatan, tahap pertumbuhan, gambar, dll) yang ada pada situs: [perenual.com](https://perenual.com/)

# Preview
<img src="https://github.com/yashlan/PlantSnap/blob/main/ss/ss_1.gif" width="200" /> <img src="https://github.com/yashlan/PlantSnap/blob/main/ss/ss_2.gif" width="200" /> <img src="https://github.com/yashlan/PlantSnap/blob/main/ss/ss_3.gif" width="200" /> 



# Info
Endpoint Plant List<br>
``` curl
GET https://perenual.com/api/species-list?key=YOUR_API_KEY
```

Response<br>
``` json
{
    "data": [
        {
            "id": 1,
            "common_name": "European Silver Fir",
            "scientific_name": [
                "Abies alba"
            ],
            "other_name": [
                "Common Silver Fir"
            ],
            "cycle": "Perennial",
            "watering": "Frequent",
            "sunlight": [],
            "default_image": {
                "image_id": 9,
                "license": 5,
                "license_name": "Attribution-ShareAlike License",
                "license_url": "https://creativecommons.org/licenses/by-sa/2.0/",
                "original_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/og/49255769768_df55596553_b.jpg",
                "regular_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/regular/49255769768_df55596553_b.jpg",
                "medium_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/medium/49255769768_df55596553_b.jpg",
                "small_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/small/49255769768_df55596553_b.jpg",
                "thumbnail": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/thumbnail/49255769768_df55596553_b.jpg"
            }
        },
        {
            "id": 2,
            "common_name": "Pyramidalis Silver Fir",
            "scientific_name": [
                "Abies alba 'Pyramidalis'"
            ],
            "cycle": "Perennial",
            "watering": "Frequent",
            "sunlight": [],
            "other_name": null,
            "default_image": {
                "image_id": 9,
                "license": 5,
                "license_name": "Attribution-ShareAlike License",
                "license_url": "https://creativecommons.org/licenses/by-sa/2.0/",
                "original_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/og/49255769768_df55596553_b.jpg",
                "regular_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/regular/49255769768_df55596553_b.jpg",
                "medium_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/medium/49255769768_df55596553_b.jpg",
                "small_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/small/49255769768_df55596553_b.jpg",
                "thumbnail": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/thumbnail/49255769768_df55596553_b.jpg"
            }
        }
        ...
    ],
    "to": 30,
    "per_page": 30,
    "current_page": 1,
    "from": 1,
    "last_page": 405,
    "total": 10104
}
```


Dokumentasi Lengkap API : https://perenual.com/docs/api<br>
API Limit (free) : 100 req/day<br>
