CFLAGS= -g

HEADER_FILES = src
SOURCE_FILES = src/captcha.c

OBJECT_FILES = $(SOURCE_FILES:.c=.o)

PREFIX=$(MIX_APP_PATH)/priv

.PHONY: all clean

all: $(PREFIX)/captcha

$(PREFIX)/captcha: clean priv $(OBJECT_FILES)
	mkdir -p $(PREFIX)
	$(CC) -I $(HEADER_FILES) -o $@ $(LDFLAGS) $(OBJECT_FILES) $(LDLIBS)

clean:
	rm -f $(PREFIX)/captcha $(OBJECT_FILES) $(BEAM_FILES)