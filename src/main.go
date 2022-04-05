package main

import (
	"database/sql"
	"fmt"
	"log"
	"os"
	"time"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	// Open up our database connection.
	// I've set up a database on my local machine using phpmyadmin.
	// The database is called testDb

	conn := os.Getenv("DB_USER") + ":" + os.Getenv("DB_PASS") + "@tcp(" + os.Getenv("DB_PASS") + ":" + os.Getenv("DB_PORT") + ")/test"
	db, err := sql.Open("mysql", conn)

	// if there is an error opening the connection, handle it
	if err != nil {
		panic(err.Error())
	}
	var version string

	err2 := db.QueryRow("SELECT VERSION()").Scan(&version)

	if err2 != nil {
		log.Fatal(err2)
	}

	fmt.Println(version)
	// defer the close till after the main function has finished
	// executing
	defer db.Close()
	time.Sleep(8 * time.Hour)
}
