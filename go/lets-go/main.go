package main

import (
        "fmt"

        "emilywoods/lets-go/api"
)

func main() {
        respHex, errHex := api.CallHexbot()
        fmt.Printf("Error: %v\n", errHex)
        fmt.Printf("Response: %+v\n", respHex)

        respVex, errVex := api.CallVexbot()
        fmt.Printf("Error: %v\n", errVex)
        fmt.Printf("Response: %+v\n", respVex)
}

