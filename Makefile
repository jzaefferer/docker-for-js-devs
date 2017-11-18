image = jzaefferer/pet-reminder

.PHONY: build

local:
	docker-compose up --build
build:
	docker build -f Dockerfile-prod -t $(image) .
run:
	docker run -it -p 3000:80 $(image):latest
push:
	docker push $(image)
deploy:
	sloppy change sloppy.yml
