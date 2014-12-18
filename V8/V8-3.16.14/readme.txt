
This directory contains the necessary files to generate the V8 *static* libraries using the VC++ 2012.

Unfortunately, the 'make' files provided by Google only generate the VC++ solution for either the 
32 or 64 bit *but* not both. (It is possible to change this behaviour but not now.)

To generate the static libraries for the 32 bit windows versions proceed as follows:

1) In this directory execute the script makev8_32.bat - this will execute a python script
   which in turn executes the GYP build system to output the VC++ solution and its corresponding
   projects.
   
2) In the directory .\build you should have the file <all.sln>. Open the VC++ solution using the VC++ 2012
   IDE. (Command line coming soon.) Warning: when you, for the fist time, open the solution <all.sln> you
   will be prompted to convert the solution to VC++ 2012 format - you should ACCEPT this and proceed,
   otherwise you will have to manually modify the tool-set. You must change the platform tool-set 
   to the same tool-set which you will build the arango executables. The VC++ 2012 tool-set is referred
   to as v110 - you will need to ensure that both the libraries and the final arango executables are 
   built with the same tool-set. 
   
3) Choose either the release or debug in the configuration and then rebuild the solution. There will be
   one project which will fail - the test. (For some reason everyone loves to code for dynamic libraries
   and when you want to build static ones ... .)

4) Copy the libraries onto the path where arango source is. 

   For example for the windows library <v8_base.lib> generated as a 32 bit Release version:
   Go to the directory .\build\Release\lib and copy the file <v8_base.lib> to the
   arango source tree .\3rdParty\VisualStudio\V8\lib32\ as the file <v8_base.lib>.
   
   For example for the windows library <v8_base.lib> generated as a 32 bit Debug version:
   Go to the directory .\build\Debug\lib and copy the file <v8_base.lib> to the
   arango source tree .\3rdParty\VisualStudio\V8\lib32\ as the file <v8_base_MTd.lib>.
   
5) Include files which are required by the arango executables and libraries are provided by Goolge 
   under the directory .\include. Copy this to the arango source tree
   .\3rdParty\VisualStudio\V8\include
   
   
To generate the static libraries for the 64 bit windows versions proceed as follows:

1) In this directory execute the script makev8_64.bat - this will execute a python script
   which in turn executes the GYP build system to output the VC++ solution and its corresponding
   projects.
   
   The rest follows in an analogous manner to the 32 bit instructions above.

   
   

