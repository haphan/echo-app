package main

import (
	"net/http"
	"fmt"
	"os"

	"github.com/gorilla/handlers"
)

func main() {
	handler := http.NewServeMux()

	handler.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "ok")
	})

	handler.HandleFunc("/hostname", func(w http.ResponseWriter, r *http.Request) {
		name, _ := os.Hostname()

		fmt.Fprint(w, name)
	})

	handler.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, fmt.Sprintf("%s %s %s\n", r.Method, r.URL.RequestURI(), r.Proto))
	})

	fmt.Println("Server started on port 8080")
	http.ListenAndServe(":8080", handlers.LoggingHandler(os.Stdout, handler))
}
