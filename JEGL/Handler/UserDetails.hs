module Handler.UserDetails where

import Import


getUserDetailsR :: UsersId -> Handler Html
getUserDetailsR usersId = do
    userDetails <- runDB $ get404 usersId
    userReviews <- runDB $ selectList [ReviewUser ==. usersId] [Desc ReviewId]
    defaultLayout $ do
        $(widgetFile "users/user")
