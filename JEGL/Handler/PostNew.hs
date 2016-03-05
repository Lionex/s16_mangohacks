module Handler.PostNew where

import Import
import Yesod.Form.Bootstrap3

data BlogPost = BlogPost
        { title :: Text
        , article :: Text
        }

--areq returns an AForm and takes three arguments

blogPostForm :: AForm Handler BlogPost
blogPostForm = BlogPost
            <$> areq textField (bfs ("Title" :: Text)) Nothing
            <*> areq textField (bfs ("Blog Post" :: Text)) Nothing

getPostNewR :: Handler Html
getPostNewR = do
    (widget, enctype) <- generateFormPost $ renderBootstrap3 BootstrapBasicForm blogPostForm
    defaultLayout $ do
        $(widgetFile "posts/new")
