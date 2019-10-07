# .PHONY: lint

# lint:
# 	@luacheck -q ./lib

# make DESTDIR = LUA_LIB_DIR=/usr/local/openresty/lualib
OPENRESTY_PREFIX=/usr/local/openresty

#LUA_VERSION := 5.1
PREFIX ?=          /usr/local
LUA_INCLUDE_DIR ?= $(PREFIX)/include
LUA_LIB_DIR ?=     $(PREFIX)/lib/lua/$(LUA_VERSION)
INSTALL ?= install

.PHONY: all test install

all: ;

install: all
	$(INSTALL) -d $(DESTDIR)$(LUA_LIB_DIR)/resty/session/
	$(INSTALL) -d $(DESTDIR)$(LUA_LIB_DIR)/resty/session/ciphers
	$(INSTALL) -d $(DESTDIR)$(LUA_LIB_DIR)/resty/session/encoders
	$(INSTALL) -d $(DESTDIR)$(LUA_LIB_DIR)/resty/session/hmac
	$(INSTALL) -d $(DESTDIR)$(LUA_LIB_DIR)/resty/session/identifiers
	$(INSTALL) -d $(DESTDIR)$(LUA_LIB_DIR)/resty/session/serializers
	$(INSTALL) -d $(DESTDIR)$(LUA_LIB_DIR)/resty/session/storage
	$(INSTALL) -d $(DESTDIR)$(LUA_LIB_DIR)/resty/session/strategies
	#
	$(INSTALL) lib/resty/*.lua $(DESTDIR)$(LUA_LIB_DIR)/resty/
	$(INSTALL) lib/resty/session/*.lua $(DESTDIR)$(LUA_LIB_DIR)/resty/session/
	$(INSTALL) lib/resty/session/ciphers/*.lua $(DESTDIR)$(LUA_LIB_DIR)/resty/session/ciphers/
	$(INSTALL) lib/resty/session/encoders/*.lua $(DESTDIR)$(LUA_LIB_DIR)/resty/session/encoders/
	$(INSTALL) lib/resty/session/hmac/*.lua $(DESTDIR)$(LUA_LIB_DIR)/resty/session/hmac/
	$(INSTALL) lib/resty/session/identifiers/*.lua $(DESTDIR)$(LUA_LIB_DIR)/resty/session/identifiers/
	$(INSTALL) lib/resty/session/serializers/*.lua $(DESTDIR)$(LUA_LIB_DIR)/resty/session/serializers/
	$(INSTALL) lib/resty/session/storage/*.lua $(DESTDIR)$(LUA_LIB_DIR)/resty/session/storage/
	$(INSTALL) lib/resty/session/strategies/*.lua $(DESTDIR)$(LUA_LIB_DIR)/resty/session/strategies/
	# $(INSTALL) lib/resty/core/*.lua $(DESTDIR)$(LUA_LIB_DIR)/resty/core/
	# $(INSTALL) lib/ngx/*.lua $(DESTDIR)$(LUA_LIB_DIR)/ngx/
	# $(INSTALL) lib/ngx/ssl/*.lua $(DESTDIR)$(LUA_LIB_DIR)/ngx/ssl/

test: all
	PATH=$(OPENRESTY_PREFIX)/nginx/sbin:$$PATH prove -I../test-nginx/lib -r t
