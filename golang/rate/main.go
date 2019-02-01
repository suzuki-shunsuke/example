package main

import (
	"context"
	"fmt"
	"time"

	"golang.org/x/time/rate"
)

type (
	client struct {
		limiter *rate.Limiter
	}
)

func newClient() *client {
	return &client{
		// burst 5
		// 10 per minutes
		limiter: rate.NewLimiter(rate.Every(time.Minute/10), 5),
	}
}

func (c *client) hello(ctx context.Context) {
	c.limiter.Wait(ctx)
	fmt.Println("hello")
}

func main() {
	ctx := context.Background()
	c := newClient()
	// about 2min
	for i := 0; i < 6; i++ {
		c.hello(ctx)
	}
	time.Sleep(time.Second * 30)
	for i := 0; i < 6; i++ {
		c.hello(ctx)
	}
}
