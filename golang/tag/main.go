package main

import (
	"fmt"
	"reflect"
)

type (
	Foo struct {
		A int `incr:""`
		B int
	}
)

func main() {
	f := Foo{
		A: 1,
		B: 1,
	}
	v := reflect.ValueOf(&f)
	vs := v.Elem()
	n := vs.NumField()
	for i := 0; i < n; i++ {
		field := vs.Field(i)
		_, ok := vs.Type().Field(i).Tag.Lookup("incr")
		if !ok {
			continue
		}
		a := field.Interface()
		i, ok := a.(int)
		if !ok {
			continue
		}
		fmt.Println("incr")
		i++
		value := reflect.ValueOf(i)
		field.Set(value)
	}
	fmt.Printf("A: %d, B: %d\n", f.A, f.B)
}
