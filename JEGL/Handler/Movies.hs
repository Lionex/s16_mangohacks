module Handler.Movies where

import Import

getMoviesR :: Handler Html
getMoviesR = do
    allMovies <- runDB $ selectList [] [Asc MovieId]
    defaultLayout $ do
        $(widgetFile "movies/index")
