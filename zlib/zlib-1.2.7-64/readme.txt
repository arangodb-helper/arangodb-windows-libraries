libraries for zip version 1.2.8

Apparently there is a bug with the 1.2.7 version and it is recommended that users upgrade.

..\include\  contains the header files you require to call and link the library within your application
..\lib32\    contains the STATIC libraries, the zlibstat_MTd contains the windows DEBUG symbols so that
             an application compiled as 'Debug' can call the necessary library functions.
..\lib64\    same as the lib32 directory except it contains the 64bit libraries which you use to link
             in your 64bit application
        
   