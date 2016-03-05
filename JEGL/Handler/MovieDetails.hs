module Handler.MovieDetails where

import Import

getMovieDetailsR :: MovieId -> Handler Html
getMovieDetailsR movieId = do
    movieDetails <- runDB $ get404 movieId
    defaultLayout $ do
        $(widgetFile "movies/movie")
