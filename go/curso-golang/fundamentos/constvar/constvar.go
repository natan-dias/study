package main

import (
	"fmt"
	m "math"
)

func main() {
	const PI float64 = 3.1415
	var raio = 3.2

	area := PI * m.Pow(raio, 2)
	fmt.Println("A área da circunferência é", area)

	// como declarar separadamente

	const (
		a = 1
		b = 2
	)

	var (
		c = 3
		d = 4
	)

	println(a, b, c, d)

	// Outras formas

	var e, f bool = true, false
	fmt.Println(e, f)

	g, h, i := 2, false, "epa!"
	fmt.Println(g, h, i)
}
