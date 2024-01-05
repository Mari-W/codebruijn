#!/bin/bash
open $1.pdf &
latexmk -pvc -pdf -shell-escape -e '$pdflatex=q/xelatex %O -interaction=nonstopmode %S/' $1.tex