import ctypes
lib=ctypes.cdll.LoadLibrary('./dist-newstyle/build/x86_64-linux/ghc-8.10.4/project0-1.0.0/f/profile/build/profile/libprofile.so')
lib.main()