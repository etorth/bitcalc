#=====================================================================================
#
#      Filename: Makefile
#       Created: 11/03/2017 20:51:28
# Last Modified: 11/26/2017 15:56:15
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

CXXFLAGS := $(shell $(FLTKCONF) --cxxflags) -std=c++11 -g3 -O0 -Wall -fsanitize=address
LDFLAGS  := $(shell $(FLTKCONF) --ldflags) -fsanitize=address

FL_HPP := $(addsuffix .hpp, $(basename $(SRC_FL)))
FL_CPP := $(addsuffix .cpp, $(basename $(SRC_FL)))

OBJS := $(addsuffix .o, $(basename $(SRC_FL) $(SRC_XX)))

.PHONY: clean all

all: $(OBJS)
	$(CXX) -o bitcalc $^ $(LDFLAGS)

# %.hpp %.cpp: %.fl
# 	$(FLUID) -c -o $*.cpp -h $*.hpp $<

%.hpp: %.fl
	$(FLUID) -c -o $*.cpp -h $*.hpp $<

$(FL_CPP): $(FL_HPP)
	# do nothing

clean:
	-$(RM) $(OBJS) *.d bitcalc $(addsuffix .hpp, $(basename $(SRC_FL))) $(addsuffix .cpp, $(basename $(SRC_FL)))

-include $(OBJS:.o=.d)
