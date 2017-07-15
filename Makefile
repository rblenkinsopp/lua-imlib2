# change these to reflect your Lua installation
LUA    ?= /usr
LUAINC ?= $(LUA)/usr/include
LUALIB ?= $(LUA)/lib
LUABIN ?= $(LUA)/bin

# no need to change anything below here
CFLAGS= $(INCS) $(DEFS) $(WARN) -O2 -fPIC
WARN= -Wall -Werror -Wno-unused-but-set-variable
INCS= -I$(LUAINC)
LIBS= -lImlib2

OBJS= limlib2.o

SO= limlib2.so

all: limlib2.so

$(SO): $(OBJS)
	$(CC) -o $@ -shared $(OBJS) $(LIBS)

.PHONY: clean doc test
clean:
	rm -f $(OBJS) $(SO) *.png core core.* a.out

doc:
	lua doc/extract_doc.lua limlib2.c > doc/doc.html

test:
	./lunit test/*
