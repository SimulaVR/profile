{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Dhall

data KeyboardShortcut = KeyboardShortcut {
  _keyCombination :: [String]
, _keyAction      :: String
} deriving (Generic, Show)

data KeyboardRemapping = KeyboardRemapping {
  _keyOriginal :: String
, _keyMappedTo :: String
} deriving (Generic, Show)

data StartingApps = StartingApps {
  _center :: Maybe String
, _right  :: Maybe String
, _bottom :: Maybe String
, _left   :: Maybe String
, _top    :: Maybe String
} deriving (Generic, Show)

data Configuration = Configuration {
  _backend :: String
, _startingApps :: StartingApps
, _defaultWindowResolution :: Maybe (Natural, Natural)
, _defaultWindowScale :: Double
, _keyBindings :: [KeyboardShortcut]
, _keyRemappings :: [KeyboardRemapping]
, _environmentsDirectory :: String
, _environmentDefault :: String
-- , _defaultTransparency :: Double -- Remove until order independent transparency is implemented
} deriving (Generic, Show)

instance FromDhall KeyboardRemapping
instance FromDhall KeyboardShortcut
instance FromDhall Configuration
instance FromDhall StartingApps

parseConfiguration :: IO (Configuration)
parseConfiguration = do
  config <- input auto "./config.dhall" :: IO Configuration
  return config

main :: IO ()
main = do
  parseConfiguration
  putStrLn "Hello, world!"

foreign export ccall main :: IO ()