all: comp

# Compilation of Ocaml files
# Attention: order of object files important 
comp: lang.cmo parser.cmo lexer.cmo typing.cmo\
      instrs.cmo gen.cmo graph.cmo code2graph.cmo interf.cmo comp.cmo
	ocamlc -o comp $^

# Compilation of .ml files
lang.cmo: lang.ml
	ocamlc -c $<

typing.cmo: typing.ml lang.cmo
	ocamlc -c $<

instrs.cmo:  instrs.ml lang.cmo
	ocamlc -c $<

gen.cmo: gen.ml lang.cmo instrs.cmo
	ocamlc -c $<

graph.cmo: graph.ml
	ocamlc -c $<

code2graph.cmo: code2graph.ml instrs.cmo graph.cmo
	ocamlc -c $<

interf.cmo: interf.ml lexer.cmo parser.cmo gen.cmo graph.cmo code2graph.cmo typing.cmo
	ocamlc -c $<

comp.cmo: comp.ml gen.cmo typing.cmo parser.cmo interf.cmo
	ocamlc -c $<


# ocaml lexer and parser

# TODO: comment in when developing the lexer / parser
# lexer.ml: lexer.mll lang.cmo
# 	ocamllex $<

# parser.ml parser.mli: parser.mly lang.cmo
# 	ocamlyacc $<

lexer.cmo: lexer.ml parser.cmo
	ocamlc -c $<
parser.cmo: parser.ml parser.cmi lang.cmo
	ocamlc -c $<


#### Generic rules

%.cmi: %.mli
	ocamlc -c $<


.PHONY: clean

clean: 
	rm -f lexer.ml parser.ml *.mli *.cmi *.cmo
