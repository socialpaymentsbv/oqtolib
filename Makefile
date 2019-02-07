REBAR := ./resource/rebar3

.PHONY: test compile build run

all: test compile

compile:
	$(REBAR) compile

test:
	$(REBAR) ct

shell:
	$(REBAR) shell

build:
	$(REBAR) release

run:
	./_build/default/rel/oqtolib/bin/oqtolib console
