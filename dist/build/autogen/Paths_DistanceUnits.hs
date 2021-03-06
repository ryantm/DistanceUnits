module Paths_DistanceUnits (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/matt/.cabal/bin"
libdir     = "/home/matt/.cabal/lib/DistanceUnits-0.1.0.0/ghc-7.4.1"
datadir    = "/home/matt/.cabal/share/DistanceUnits-0.1.0.0"
libexecdir = "/home/matt/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "DistanceUnits_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "DistanceUnits_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "DistanceUnits_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "DistanceUnits_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
