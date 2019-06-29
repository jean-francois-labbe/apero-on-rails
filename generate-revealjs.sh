pandoc -t html5 --template=template-revealjs.html --standalone --section-divs --variable theme="white" --variable transition="none" slides.md -o revealjs/slides.html
cp -r img revealjs/
