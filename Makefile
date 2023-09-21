clean_install:
	conda create -n mkdocs python=3.10
	conda activate mkdocs
	pip install mkdocs-material
	mkdocs new .

install_from_repo:
	conda env create -n mkdocs -f conda_env.yml
	conda activate mkdocs

upgrade:
	conda activate mkdocs
	pip install --upgrade --force-reinstall mkdocs-material
	conda env export -n mkdocs > conda_env.yml

sync:
	mkdocs build
	git add -A
	git commit -m '$(m)'
	git push origin main

dev:
	mkdocs serve
