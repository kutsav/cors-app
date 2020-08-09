tag=1.0
name=cors-app

build:
	docker build -t quay.io/kutsav/${name}:${tag} .

push:
	docker push quay.io/kutsav/${name}:${tag}

run:
	docker run -d --rm --name ${name} -p 5000:5000 quay.io/kutsav/${name}:${tag}

ci:
	make build
	make push
