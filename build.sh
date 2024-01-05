#!/bin/bash
latexmk -pdf -halt-on-error -shell-escape -xelatex $1.tex