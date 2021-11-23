package main

import (
	"crypto/rand"
	"crypto/sha256"
	"encoding/hex"
	"flag"
	"net/http"
)


var addr = flag.String("addr", ":8080", "address to bind to")

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, req *http.Request) {
		buf := make([]byte, 10)
		if _, err := rand.Read(buf); err != nil {
			panic(err)
		}

		hasher := sha256.New()
		if _, err := hasher.Write(buf); err != nil {
			panic(err)
		}

		if _, err := hex.NewEncoder(w).Write(hasher.Sum(nil)); err != nil {
			panic(err)
		}
	})

	if err := http.ListenAndServe(*addr, nil); err != nil {
		panic(err)
	}
}
