package main

import (
	"context"
	"fmt"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	"github.com/suzuki-shunsuke/example/golang/grpc/hello/hello"
)

type (
	server struct{}
)

func (s *server) SayHello(
	ctx context.Context, req *hello.HelloRequest,
) (*hello.HelloReply, error) {
	return &hello.HelloReply{Message: fmt.Sprintf("Hello %s", req.GetName())}, nil
}

func main() {
	lis, _ := net.Listen("tcp", ":5000")
	s := grpc.NewServer()
	srv := server{}
	hello.RegisterHelloServer(s, &srv)
	reflection.Register(s)
	s.Serve(lis)
}
