# iste422book

This repository contains the files needed to create `book.pdf`, as well as that file itself, the Study Guide for ISTE422, *Application Development Practices*, a course taught at Rochester Institute of Technology, Golisano College of Computing and Information Sciences.

You can create the pdf by cloning this repository and typing `make` at the command line in the target directory. This assumes that you have

- a full TexLive installation with local files expected in the directory pointed to by `texdir` in the `Makefile`, and
- copy of Pandoc that expects configuration files in the directory pointed to by `pandir` in the `Makefile`.

If either condition is not met, you must modify the `Makefile` accordingly.

The content of this book is in the enclosed Markdown files. I gratefully accept improvements to these files.
