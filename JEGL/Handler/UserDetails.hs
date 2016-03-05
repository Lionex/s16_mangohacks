module Handler.UserDetails where

import Import


getUserDetailsR :: UsersId -> Handler Html
getUserDetailsR usersId = do
    userDetails <- runDB $ get404 usersId
    defaultLayout $ do
        $(widgetFile "users/user")
