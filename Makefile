##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## Makefile
##

NAME	=	libasm.so

SRC	=	src/strlen.asm \
		src/strchr.asm \
		src/strcmp.asm \
		src/strncmp.asm \
		src/memset.asm \
		src/memmove.asm \
		src/memcpy.asm \
		src/rindex.asm
		#src/strcasecmp.asm

ASM =	nasm

ASMFLAG =	-f elf64

LD =	ld

RM =	rm -f

OBJS =	$(SRC:.asm=.o)

$(NAME) :	$(OBJS)
			$(LD) -shared -fPIC -o $(NAME) $(OBJS)

%.o		: %.asm
		$(ASM) $(ASMFLAG) $< -o $@

all : $(NAME)

clean :
		$(RM) $(OBJS)

fclean : clean
		$(RM) $(NAME)

re : fclean all

.PHONY : all clean fclean re