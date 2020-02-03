CXXFLAGS += -I.
CXXFLAGS += -std=c++2a
CXXFLAGS += -Wall -Wextra
CXXFLAGS += -DBOOST_TEST_DYN_LINK
CXXFLAGS += -fprofile-arcs -ftest-coverage

BOOST_LIB = -lboost_unit_test_framework

HPP_FILES = $(wildcard *.hpp)
COMPILED_HPP_FILES = $(patsubst %.hpp,%.compiled_hpp,$(HPP_FILES))
CPP_FILES = $(wildcard *.cpp)

.PHONY: test.output
test.output: test makefile
	@./$<

test: $(CPP_FILES) $(COMPILED_HPP_FILES)
	@$(CXX) $(CXXFLAGS) -O $(CPP_FILES) $(BOOST_LIB) -o $@

# This rule ensures header files build in their own right.
# The quality of header files is important because header files
# are #included from other files and thus have a large span
# of influence (unlike .cpp files which are not #included)

%.compiled_hpp: %.hpp
	@$(CXX) -x c++ $(CXXFLAGS) -c -o $@ $<
