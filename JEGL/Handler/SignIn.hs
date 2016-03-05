module Handler.SignIn where

import Import

getSignInR :: Handler Html
getSignInR = do
    defaultLayout $ do
        $(widgetFile "signin")
