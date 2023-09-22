clean_install:
	conda create -n mkdocs python=3.10
	pip install mkdocs-material mkdocs-git-revision-date-localized-plugin mkdocs-table-reader-plugin mkdocs-glightbox mkdocs-nav-weight
	mkdocs new .

install_from_repo:
	conda env create -n mkdocs -f conda_env.yml

upgrade:
	pip install --upgrade --force-reinstall mkdocs-material
	conda env export -n mkdocs > conda_env.yml

sync:
	git add -A
	git commit -m '$(m)'
	git push origin main

dev:
	mkdocs serve
