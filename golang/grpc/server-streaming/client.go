package main

import (
	"context"
	"io"
	"log"

	"google.golang.org/grpc"

	"github.com/suzuki-shunsuke/example/golang/grpc/server-streaming/hello"
)

func main() {
	conn, err := grpc.Dial("localhost:5000", grpc.WithInsecure())
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()
	c := hello.NewHelloClient(conn)
	stream, err := c.SayHello(context.Background(), &hello.HelloRequest{Name: "Bob"})
	if err != nil {
		log.Fatal(err)
	}
	for {
		rep, err := stream.Recv()
		if err == io.EOF {
			break
		}
		if err != nil {
			log.Fatal(err)
		}
		log.Println(rep.GetMessage())
	}
}
