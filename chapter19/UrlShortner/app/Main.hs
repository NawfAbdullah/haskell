{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Monad (replicateM)
import Control.Monad.IO.Class (liftIO)
import qualified Data.ByteString.Char8 as BC
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import qualified Data.Text.Lazy as TL
import qualified Database.Redis as R 
import Network.URI (URI, parseURI)
import qualified System.Random as SR 
import Web.Scotty

alphaNum :: String
alphaNum = ['A'..'Z'] ++ ['0'..'9']

randomElement :: String -> IO Char
randomElement xs = do 
    let maxIndex :: Int 
        maxIndex = length xs - 1

    randomDigit <- SR.randomRIO (0, maxIndex) :: IO Int 
    return $ xs !! randomDigit

shortyGen :: IO String
shortyGen = replicateM 7 (randomElement alphaNum)

saveURI :: R.Connection -> BC.ByteString -> BC.ByteString -> IO (Either R.Reply R.Status)
saveURI conn shorty uri = 
    R.runRedis conn $ R.set shorty uri 

getURI :: R.Connection -> BC.ByteString -> IO (Either R.Reply (Maybe BC.ByteString))
getURI conn shortURI = 
    R.runRedis conn $ R.get shortURI

linkShorty :: String -> String

linkShorty shorty = 
    concat [
        "<a href = \"", 
        shorty,
        "\"> Copy and paste your short url </a>"
    ]


shortyCreated :: Show a => a -> String -> TL.Text 
shortyCreated resp shorty = 
    TL.concat [
        TL.pack (show resp),
        TL.pack " shorty is: ", 
        TL.pack (linkShorty shorty)
    ]
shortyAintUri :: TL.Text -> TL.Text
shortyAintUri shorty = 
    TL.concat [
        "The shorty: ", 
        shorty, 
        " is not a valid URI. Please try again."
    ]

shortyFound :: TL.Text -> TL.Text
shortyFound tbs = 
    TL.concat [
        "<a href = \"",
        tbs,
        TL.pack "\">",
        tbs,
        TL.pack "</a>"
    ]

app :: R.Connection -> ScottyM ()
app rConn = do 
    get "/" $ do 
        uri <- param "uri"

        let parsedURI :: Maybe URI 
            parsedURI = parseURI (TL.unpack uri)
        case parsedURI of
            Just _ -> do 
                shawty <- liftIO shortyGen
                let shorty = BC.pack shawty
                    uri' = encodeUtf8 (TL.toStrict uri)
                resp <- liftIO $ saveURI rConn shorty uri'
                html $ shortyCreated resp shawty
            Nothing -> html $ shortyAintUri  uri
    get "/:shorty" $ do
        short <- param (TL.pack "shorty")
        let shortBS = encodeUtf8 (TL.toStrict short)
        uri <- liftIO (getURI rConn shortBS)
        case uri of

            Left reply -> text $ TL.pack (show reply)
            Right mbDs -> case mbDs of
                Nothing -> text (TL.pack "Shorty not found. Try again.")
                Just bs -> html (shortyFound tbs) where
                    tbs :: TL.Text
                    tbs = TL.fromStrict (decodeUtf8 bs)

main :: IO ()
main = do
    rConn <- R.connect R.defaultConnectInfo
    scotty 3000 (app rConn)
