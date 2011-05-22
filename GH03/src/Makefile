default: 
	mkdir bin
	alex Lexer.x -o bin/Lexer.hs
	ghc --make -optl -w -o bin/vecti -odir bin -hidir bin bin/Lexer.hs Token.hs

doc:	
	mkdir doc
	haddock --odir=doc bin/Lexer.hs Token.hs

clean:
	rm -R bin

cleanall:
	rm -R bin doc
