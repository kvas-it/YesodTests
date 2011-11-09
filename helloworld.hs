{-# LANGUAGE TypeFamilies, QuasiQuotes, MultiParamTypeClasses,
                TemplateHaskell, OverloadedStrings #-}
import Yesod

data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
|]

instance Yesod HelloWorld where
    approot _ = ""

getHomeR :: Handler RepHtml
getHomeR = defaultLayout [whamlet|Hello World!|]

main :: IO ()
main = warpDebug 8080 HelloWorld

