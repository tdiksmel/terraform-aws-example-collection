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

	fmt.Printf("DB_USER: %+v\n", os.Getenv("DB_USER"))
	fmt.Printf("DB_PASS: %+v\n", os.Getenv("DB_PASS"))
	fmt.Printf("DB_HOST: %+v\n", os.Getenv("DB_HOST"))
	fmt.Printf("DB_PORT: %+v\n", os.Getenv("DB_PORT"))
	fmt.Printf("DB_NAME: %+v\n", os.Getenv("DB_NAME"))

	conn := os.Getenv("DB_USER") + ":" + os.Getenv("DB_PASS") + "@tcp(" + os.Getenv("DB_HOST") + ":" + os.Getenv("DB_PORT") + ")/" + os.Getenv("DB_NAME")
	db, err := sql.Open("mysql", conn)

	// if there is an error opening the connection, handle it
	if err != nil {
		log.Printf("%v\n", err.Error())
	}
	var version string

	err2 := db.QueryRow("SELECT VERSION()").Scan(&version)

	if err2 != nil {
		log.Println(err2)
	}

	fmt.Println(version)
	// defer the close till after the main function has finished
	// executing
	defer db.Close()
	time.Sleep(8 * time.Hour)
}
