---
title: "Building Instructions"
date: 2018-01-28T21:48:10+01:00
anchor: "building"
weight: 20
---

Sie benötigen eine aktuelle Installation von Latex, sowie Git um die Quelldateien von Github zu laden. Die folgende Anleitung erzeugt eine Datei main.pdf in der sich das Buch befindet.

```bash
# Dateien auschecken
git clone git@github.com:wysiib/ai_script.git

# In den Ordner wechseln
cd ai_script

# Alternative 1: Latexmk (empfohlen!)
latexmk -pdf main.tex

# Alternative 2: Latex direkt ausführen
pdflatex main.tex
makeindex main.idx -s StyleInd.ist
biber main
pdflatex main.tex
pdflatex main.tex
```
