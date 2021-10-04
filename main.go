package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, world!")
	})

	http.HandleFunc("/greet", func(w http.ResponseWriter, r *http.Request){
		fmt.Fprintf(w, "Greetings, fellow traveler!")
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}
