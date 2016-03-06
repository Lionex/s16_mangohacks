module Handler.Users where

import Import
import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3,
                              withSmallInput)

getUsersR :: Handler Html
getUsersR  =  do
    allUsers <- runDB $ selectList [] [Desc UsersId]
    defaultLayout $ do
        $(widgetFile "users/index")
