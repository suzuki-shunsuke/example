package main

import (
	"fmt"
	"github.com/getsentry/raven-go"
	"log"
)

const (
	dsn = "http://<key>@localhost:8080/1"
)

func main() {
	if err := raven.SetDSN(dsn); err != nil {
		log.Fatal(err)
	}
	raven.CaptureErrorAndWait(fmt.Errorf("network error"), nil)
	fmt.Errorf("network error")
}
