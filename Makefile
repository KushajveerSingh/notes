install:
	pip install mkdocs-material

upgrade:
	pip install --upgrade --force-reinstall mkdocs-material

sync:
	git add -A
	git commit -m '$(m)'
	git push origin main