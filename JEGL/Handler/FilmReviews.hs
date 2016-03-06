module Handler.FilmReviews where

import Import

getFilmReviewsR :: MovieId -> Handler Html
getFilmReviewsR    movieId  = do
    allReviews <- runDB $ selectList [ReviewMovie ==. movieId] [Desc ReviewId]
    defaultLayout $ do
        $(widgetFile "reviews/list")
