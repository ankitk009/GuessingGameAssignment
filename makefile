all: README.md

README.md:
	@echo "Guessing Game Assignment" > README.md
	@date '+%d/%m/%Y %H:%M:%S' >> README.md
	@< guessinggame.sh wc -l >> README.md

clean:
	@rm README.md
