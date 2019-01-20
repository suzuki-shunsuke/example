package main

import (
	"context"
	"fmt"
	"log"

	"google.golang.org/grpc"

	"github.com/suzuki-shunsuke/example/golang/grpc/hello/hello"
)

func main() {
	conn, err := grpc.Dial("localhost:5000", grpc.WithInsecure())
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()
	c := hello.NewHelloClient(conn)
	rep, err := c.SayHello(context.Background(), &hello.HelloRequest{Name: "Bob"})
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(rep.GetMessage())
}
