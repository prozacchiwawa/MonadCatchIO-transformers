{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_MonadCatchIO_transformers (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,3,1,3] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/arty/.etlas/bin"
libdir     = "/home/arty/.etlas/lib/eta-0.8.6.5/MonadCatchIO-transformers-0.3.1.3-inplace"
dynlibdir  = "/home/arty/.etlas/lib/eta-0.8.6.5"
datadir    = "/home/arty/.etlas/share/eta-0.8.6.5/MonadCatchIO-transformers-0.3.1.3"
libexecdir = "/home/arty/.etlas/libexec"
sysconfdir = "/home/arty/.etlas/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "MonadCatchIO_transformers_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "MonadCatchIO_transformers_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "MonadCatchIO_transformers_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "MonadCatchIO_transformers_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "MonadCatchIO_transformers_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "MonadCatchIO_transformers_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
