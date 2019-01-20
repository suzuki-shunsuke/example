package main

import (
	"io"
	"net"
	"strings"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	"github.com/suzuki-shunsuke/example/golang/grpc/client-streaming/hello"
)

type (
	server struct{}
)

func (s *server) SayHello(stream hello.Hello_SayHelloServer) error {
	names := []string{}
	for {
		req, err := stream.Recv()
		if err == io.EOF {
			return stream.SendAndClose(&hello.HelloReply{
				Message: strings.Join(names, ", "),
			})
		}
		if err != nil {
			return err
		}
		names = append(names, req.GetName())
	}
}

func main() {
	lis, _ := net.Listen("tcp", ":5000")
	s := grpc.NewServer()
	srv := server{}
	hello.RegisterHelloServer(s, &srv)
	reflection.Register(s)
	s.Serve(lis)
}
