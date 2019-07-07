### TheMovieDB Sample

- The app displays the list of movies currently in theatres in a UICollectionView. 
- Selecting a movie displays the movie details screen. If the movie is a part of a movie collection, the screen will also display a link to that collection.
- Tapping the movie collection link will display the list of movies in that collection in the UICollectionView. 

The architecture of the app follows MVVM design pattern.
The UI and models are kept to a minimum as this is a demo app and can be easily expanded. 

To run the app you will need to provide your own TheMovieDB API key in Settings -> TheMovieDB. 
The app currently doesn't display the prompt/warning for the missing API key (only logs a message to console) and that could be one of the next steps in developing the app further.

Naturally, API key is not required to run unit tests as they rely on mocks.
No integration tests provided at the moment as they would require an API key.
