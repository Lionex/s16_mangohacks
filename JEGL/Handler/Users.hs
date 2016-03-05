module Handler.Users where

import Import
import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3,
                              withSmallInput)

getUsersR :: Handler Html
getUsersR  =  do
    allPosts <- runDB $ selectList [] [Desc UsersId]
    error "Does not fucking work"
    -- defaultLayout $ do
    --     $(widgetFile "users/index")
