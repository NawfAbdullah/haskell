#!/usr/bin/env stack
-- stack --resolver lts-20.5 script --package scotty --package text

{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as T

main :: IO ()
main = scotty 3000 $ do
    get "/" $ do
        text "Hello! This is your Haskell Server."

    get "/hello/:name" $ do
        name <- param "name"
        html $ "<h1>Hello, " <> name <> "!</h1>"