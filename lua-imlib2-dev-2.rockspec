package="lua-imlib2"
version="dev-2"
source = {
   url = "https://github.com/rblenkinsopp/lua-imlib2.git",
}
description = {
   summary  = "A binding to the imlib2 image manipulation library",
   homepage = "https://github.com/rblenkinsopp/lua-imlib2",
   license  = "MIT/X11"
}
dependencies = {
   "lua >= 5.2"
}
external_dependencies = {
   IMLIB2 = {
      header = "Imlib2.h",
   }
}
build = {
   type = "builtin",
   modules = {
      limlib2 = {
         sources = {"limlib2.c"},
         libraries = {"Imlib2"},
         incdirs = {"$(IMLIB2_INCDIR)"},
         libdirs = {"$(IMLIB2_LIBDIR)"}
      },
      imlib2 = "imlib2.lua"
   }
}
