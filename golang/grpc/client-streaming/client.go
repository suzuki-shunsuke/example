package main

import (
	"context"
	"fmt"
	"log"

	"google.golang.org/grpc"

	"github.com/suzuki-shunsuke/example/golang/grpc/client-streaming/hello"
)

func main() {
	conn, err := grpc.Dial("localhost:5000", grpc.WithInsecure())
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()
	c := hello.NewHelloClient(conn)
	stream, err := c.SayHello(context.Background())
	if err != nil {
		log.Fatal(err)
	}
	for _, s := range []string{"foo", "bar", "zoo"} {
		if err := stream.Send(&hello.HelloRequest{Name: s}); err != nil {
			log.Fatal(err)
		}
	}
	rep, err := stream.CloseAndRecv()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(rep.GetMessage())
}
