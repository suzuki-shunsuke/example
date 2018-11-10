package readcloser

/*
Simple mock of io.ReadCloser .
*/

import (
	"bytes"
	"fmt"
	"io/ioutil"
)

type (
	ReadCloser struct {
		buf *bytes.Buffer
	}
)

func (rc *ReadCloser) Read(p []byte) (n int, err error) {
	return rc.buf.Read(p)
}

func (rc *ReadCloser) Close() error {
	return nil
}

func NewReadCloser(buf *bytes.Buffer) *ReadCloser {
	return &ReadCloser{buf: buf}
}

func ExampleReadCloser() {
	rc := NewReadCloser(bytes.NewBufferString("hello"))
	defer rc.Close()
	d, err := ioutil.ReadAll(rc)
	fmt.Println(string(d) == "hello" && err == nil)
	// Output:
	// true
}
