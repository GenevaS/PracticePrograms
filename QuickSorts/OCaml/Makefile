# Geneva Smith
# ----------------------------------------------------------------------------
# A Makefile for compiling the OCaml programs on Linux machines.

OC = ocamlc

OBJ1 = integerQuickSort.ml
OBJ2 = templateQuickSort.ml
OBJ3 = functionQuickSort.ml

all: intQS temQS funQS

intQS: $(OBJ1)
	$(OC) -o intQS $(OBJ1)

temQS: $(OBJ2)
	$(OC) -o temQS $(OBJ2)

funQS: $(OBJ3)
	$(OC) -o funQS $(OBJ3)

clean:
	rm *.cmi *.cmo intQS temQS funQS
