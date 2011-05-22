default: 
	alex Lexer.x
	ghc --make -optl -w -o vecti Lexer.hs Token.hs

clean:
	rm Lexer.hs *.o *.hi vecti