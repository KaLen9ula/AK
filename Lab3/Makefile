.PHONY: build

build:
	g++ ./cmd_parse_app.cpp -o cmd_parse_app

default_goal: build def 
.PHONY: def
def:
	./cmd_parse_app -l -h -v -V12

.DEFAULT_GOAL:=default_goal
