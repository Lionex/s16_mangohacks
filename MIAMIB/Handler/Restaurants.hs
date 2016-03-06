module Handler.Restaurants where

import Import

getRestaurantsR :: Handler Html
getRestaurantsR = do
    restaurantList <- runDB $ selectList [] [Asc RestaurantId]
    defaultLayout $ do
        $(widgetFile "restaurants/list")
