
all: parser.cmo lexer.cmo binexpr.cmo
	ocamlc -o binexpr $^

# Compilation of .ml files
binexpr.cmo: binexpr.ml parser.cmo
	ocamlc -c $<
lexer.cmo: lexer.ml parser.cmo
	ocamlc -c $<
parser.cmo: parser.ml parser.cmi
	ocamlc -c $<

# ocaml lexer and parser
lexer.ml: lexer.mll
	ocamllex $<

parser.ml parser.mli: parser.mly
	ocamlyacc -v $<

#### Generic rules

%.cmi: %.mli
	ocamlc -c $<


.PHONY: clean

clean: 
	rm lexer.ml parser.ml *.mli *.cmi *.cmo *.o
