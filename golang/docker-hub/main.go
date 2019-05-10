package main

import (
	"fmt"
	"log"

	"github.com/heroku/docker-registry-client/registry"
)

func main() {
	hub, err := registry.New("https://registry-1.docker.io/", "", "")
	if err != nil {
		log.Fatal(err)
	}

	imagePath := "suzukishunsuke/terraform-graylog"
	fmt.Printf("image path: %s\n", imagePath)
	tags, err := hub.Tags(imagePath)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("the number of tags: %d\n", len(tags))
	for _, tag := range tags {
		fmt.Println(tag)
	}
}
