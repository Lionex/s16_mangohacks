module Handler.NewReview where

import Import
import Yesod.Form.Bootstrap3


newReviewForm :: AForm Handler Review
newReviewForm  = Review
              <$> areq textField (bfs ("Review Title" :: Text)) Nothing
              <*> areq textField (bfs ("Review Body"  :: Text)) Nothing

getNewReviewR :: MovieId -> Handler Html
getNewReviewR movieId = do
    (widget, enctype) <- generateFormPost $ renderBootstrap3 BootstrapBasicForm newReviewForm
    defaultLayout $ do
        $(widgetFile "reviews/new")

postNewReviewR :: MovieId -> Handler Html
postNewReviewR movieId = do
    ((res, widget), enctype) <- runFormPost $ renderBootstrap3 BootstrapBasicForm newReviewForm
    case res of
        FormSuccess review -> do
            reviewId <- runDB $ insert review
            redirect $ FilmReviewsR movieId
        _ -> defaultLayout $(widgetFile "reviews/list")
