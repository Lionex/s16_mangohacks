module Handler.SignIn where

import Import

getSignInR :: Handler Html
getSignInR = do
    defaultLayout $ do
        $(widgetFile "signin")

postSignInR :: Handler Html
postSignInR = do
    error "Not implemented"
