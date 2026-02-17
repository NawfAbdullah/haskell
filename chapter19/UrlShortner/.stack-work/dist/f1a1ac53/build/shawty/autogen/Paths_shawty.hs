{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_shawty (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "C:\\Users\\knawf\\haskell_practice\\chapter19\\UrlShortner\\.stack-work\\install\\16c819f1\\bin"
libdir     = "C:\\Users\\knawf\\haskell_practice\\chapter19\\UrlShortner\\.stack-work\\install\\16c819f1\\lib\\x86_64-windows-ghc-9.4.8\\shawty-0.1.0.0-ELuWNs85ErNAlqomiSRa3m-shawty"
dynlibdir  = "C:\\Users\\knawf\\haskell_practice\\chapter19\\UrlShortner\\.stack-work\\install\\16c819f1\\lib\\x86_64-windows-ghc-9.4.8"
datadir    = "C:\\Users\\knawf\\haskell_practice\\chapter19\\UrlShortner\\.stack-work\\install\\16c819f1\\share\\x86_64-windows-ghc-9.4.8\\shawty-0.1.0.0"
libexecdir = "C:\\Users\\knawf\\haskell_practice\\chapter19\\UrlShortner\\.stack-work\\install\\16c819f1\\libexec\\x86_64-windows-ghc-9.4.8\\shawty-0.1.0.0"
sysconfdir = "C:\\Users\\knawf\\haskell_practice\\chapter19\\UrlShortner\\.stack-work\\install\\16c819f1\\etc"

getBinDir     = catchIO (getEnv "shawty_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "shawty_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "shawty_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "shawty_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "shawty_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "shawty_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '\\'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/' || c == '\\'
