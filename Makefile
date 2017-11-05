#=====================================================================================
#
#      Filename: Makefile
#       Created: 11/03/2017 20:51:28
# Last Modified: 11/03/2017 22:55:25
#
#   Description: 
#
#       Version: 1.0
#      Revision: none
#      Compiler: gcc
#
#        Author: ANHONG
#         Email: anhonghe@gmail.com
#  Organization: USTC
#
#=====================================================================================

CXX      := g++
FLUID    := fluid
FLTKCONF := fltk-config

SRC_FL := $(wildcard *.fl )
SRC_XX := $(wildcard *.cpp)

CXXFLAGS := $(shell $(FLTKCONF) --cxxflags) -std=c++11 -g3 -O0 -Wall
LDFLAGS  := $(shell $(FLTKCONF) --ldflags)

OBJS := $(addsuffix .o, $(basename $(SRC_FL) $(SRC_XX)))

.PHONY: clean all

all: $(OBJS)
	$(CXX) -o bitcalc $^ $(LDFLAGS)

%.hpp %.cpp: %.fl
	$(FLUID) -c -o $*.cpp -h $*.hpp $<

clean:
	-$(RM) $(OBJS) *.d bitcalc $(addsuffix .hpp, $(basename $(SRC_FL))) $(addsuffix .cpp, $(basename $(SRC_FL)))

-include $(OBJS:.o=.d)
