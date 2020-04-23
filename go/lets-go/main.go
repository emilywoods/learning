package main

import (
        "fmt"

        "emilywoods/lets-go/api"
        "emilywoods/lets-go/jobs"
)

func waitForResponse(results chan jobs.JobResult) {
        result := <-results

        if result.Err != nil {
          fmt.Printf("%s failed: %s\n", result.ID, result.Err.Error())

          switch res := result.Result.(type) {
          case *api.HexbotResponse:
            fmt.Printf("Hexbot successful: %+v\n", res)
          case *api.VexbotResponse:
            fmt.Printf("Vexbot successful: %+v\n", res)
          default:
            fmt.Printf("Unknown successful: %+v\n", res)
                
        }
      }
}

func main() {
        fmt.Printf("Starting now\n")
        results := make(chan jobs.JobResult)

        h := jobs.NewHexBotJob()
        go h.Start(results)

        v := jobs.NewVexBotJob()
        go v.Start(results)

        waitForResponse(results)
        waitForResponse(results)

        fmt.Println("Exitting now!\n")
}

