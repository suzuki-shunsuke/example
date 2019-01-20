package main

import (
	"fmt"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	"github.com/suzuki-shunsuke/example/golang/grpc/server-streaming/hello"
)

type (
	server struct{}
)

func (s *server) SayHello(
	req *hello.HelloRequest, stream hello.Hello_SayHelloServer,
) error {
	for _, i := range []int{1, 2, 3, 4, 5} {
		if err := stream.Send(&hello.HelloReply{
			Message: fmt.Sprintf("%d. Hello %s", i, req.GetName()),
		}); err != nil {
			return err
		}
	}
	return nil
}

func main() {
	lis, _ := net.Listen("tcp", ":5000")
	s := grpc.NewServer()
	srv := server{}
	hello.RegisterHelloServer(s, &srv)
	reflection.Register(s)
	s.Serve(lis)
}
