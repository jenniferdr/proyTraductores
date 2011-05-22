default: 
	alex src/Lexer.x -o bin/Lexer.hs
	ghc --make -optl -w -o bin/vecti -odir bin -hidir bin bin/Lexer.hs src/Token.hs

doc:	bin/Lexer.hs
	haddock -h -o doc bin/Lexer.hs src/Token.hs

clean:
	rm bin/*

cleanall:
	rm bin/* doc/*
