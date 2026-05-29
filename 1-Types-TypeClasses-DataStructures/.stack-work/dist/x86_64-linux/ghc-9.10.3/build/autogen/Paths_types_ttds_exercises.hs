{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_types_ttds_exercises (
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
bindir     = "/home/annie/Documents/Kurser/Funkprog-EDAN40/Exercises/Types-TypeClasses-DataStructures/.stack-work/install/x86_64-linux/3928e29f9e82f0e35ec6a835e241739e274dd9e917fbfec903773ef8becc0d9c/9.10.3/bin"
libdir     = "/home/annie/Documents/Kurser/Funkprog-EDAN40/Exercises/Types-TypeClasses-DataStructures/.stack-work/install/x86_64-linux/3928e29f9e82f0e35ec6a835e241739e274dd9e917fbfec903773ef8becc0d9c/9.10.3/lib/x86_64-linux-ghc-9.10.3-415c/types-ttds-exercises-0.1.0.0-JeXbd6dfhgUDTzbfMLDZIT"
dynlibdir  = "/home/annie/Documents/Kurser/Funkprog-EDAN40/Exercises/Types-TypeClasses-DataStructures/.stack-work/install/x86_64-linux/3928e29f9e82f0e35ec6a835e241739e274dd9e917fbfec903773ef8becc0d9c/9.10.3/lib/x86_64-linux-ghc-9.10.3-415c"
datadir    = "/home/annie/Documents/Kurser/Funkprog-EDAN40/Exercises/Types-TypeClasses-DataStructures/.stack-work/install/x86_64-linux/3928e29f9e82f0e35ec6a835e241739e274dd9e917fbfec903773ef8becc0d9c/9.10.3/share/x86_64-linux-ghc-9.10.3-415c/types-ttds-exercises-0.1.0.0"
libexecdir = "/home/annie/Documents/Kurser/Funkprog-EDAN40/Exercises/Types-TypeClasses-DataStructures/.stack-work/install/x86_64-linux/3928e29f9e82f0e35ec6a835e241739e274dd9e917fbfec903773ef8becc0d9c/9.10.3/libexec/x86_64-linux-ghc-9.10.3-415c/types-ttds-exercises-0.1.0.0"
sysconfdir = "/home/annie/Documents/Kurser/Funkprog-EDAN40/Exercises/Types-TypeClasses-DataStructures/.stack-work/install/x86_64-linux/3928e29f9e82f0e35ec6a835e241739e274dd9e917fbfec903773ef8becc0d9c/9.10.3/etc"

getBinDir     = catchIO (getEnv "types_ttds_exercises_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "types_ttds_exercises_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "types_ttds_exercises_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "types_ttds_exercises_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "types_ttds_exercises_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "types_ttds_exercises_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
