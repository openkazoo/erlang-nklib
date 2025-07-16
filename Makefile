APP = nklib
REBAR = rebar3

.PHONY: rel stagedevrel package all tree shell

all: compile


clean:
	$(REBAR) clean


rel:
	$(REBAR) release


compile:
	$(REBAR) compile


tests:
	$(REBAR) eunit


dialyzer:
	$(REBAR) dialyzer


xref:
	$(REBAR) xref


upgrade:
	$(REBAR) upgrade
	make tree


update:
	$(REBAR) update


tree:
	$(REBAR) tree | grep -v '=' | sed 's/ (.*//' > tree


tree-diff: tree
	git diff test -- tree


docs:
	$(REBAR) edoc


shell:
	$(REBAR) shell --config config/shell.config --name $(APP)@127.0.0.1 --setcookie nk --apps $(APP)
