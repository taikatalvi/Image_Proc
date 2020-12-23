
TARGET := out

CC := g++
LD := g++

CFLAGS := -c -Wall -std=c++14
LDFLAGS := $(shell pkg-config --libs opencv4)

INCLUDES += $(shell pkg-config --cflags opencv4)

CFLAGS += $(INCLUDES)

SOURCEDIRS := ./

SOURCES := $(notdir $(wildcard $(addsuffix /*.cpp, $(SOURCEDIRS))))

OBJECTS := $(patsubst %.cpp, %.o, $(SOURCES))

TOREMOVE += $(TARGET)
TOREMOVE += $(OBJECTS)

all: $(TARGET) clean-obj

rebuild: clean $(TARGET) clean-obj
	
$(TARGET): $(OBJECTS)
	@echo "Linking objects =>" $<
	$(LD) $(LDFLAGS) $^ -o $@

%.o: %.cpp
	@echo "Compilling C source =>" $<
	$(CC) $(CFLAGS) $< -o $@

clean-obj:
	@rm -rf $(OBJECTS)

clean:
	@rm -rf $(TOREMOVE)

test:
	@echo $(CFLAGS)