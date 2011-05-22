default: 
	alex Lexer.x -o bin/Lexer.hs
	ghc --make -optl -w -o bin/vecti -odir bin -hidir bin bin/Lexer.hs Token.hs

doc:	
	haddock --odir=doc bin/Lexer.hs Token.hs

clean:
	rm bin/*

cleanall:
	rm bin/* doc/*
