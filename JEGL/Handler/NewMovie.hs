module Handler.NewMovie where

import Import
import Yesod.Form.Bootstrap3


--areq returns an AForm and takes three arguments

newMovieForm :: AForm Handler Movie
newMovieForm = Movie
            <$> areq textField (bfs ("Title"    :: Text)) Nothing
            <*> areq textField (bfs ("Image URL"   :: Text)) Nothing
            <*> areq textField (bfs ("Genre"    :: Text)) Nothing
            <*> areq textField (bfs ("Rating"   :: Text)) Nothing
            <*> areq textField (bfs ("Synopsis" :: Text)) Nothing
            <*> areq textField (bfs ("Review"   :: Text)) Nothing
            <*> areq textField (bfs ("Year"   :: Text)) Nothing
            <*> areq textField (bfs ("Director"   :: Text)) Nothing

getNewMovieR :: Handler Html
getNewMovieR = do
    (widget, enctype) <- generateFormPost $ renderBootstrap3 BootstrapBasicForm newMovieForm
    defaultLayout $ do
        $(widgetFile "movies/new")

postNewMovieR :: Handler Html
postNewMovieR = do
    ((res, widget), enctype) <- runFormPost $ renderBootstrap3 BootstrapBasicForm newMovieForm
    case res of
        FormSuccess movie -> do
            movieId <- runDB $ insert movie
            redirect $ MovieDetailsR movieId
        _ -> defaultLayout $(widgetFile "movies/new")
