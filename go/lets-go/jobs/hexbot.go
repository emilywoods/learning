package jobs

import (
        "fmt"

        "emilywoods/lets-go/api"
)

const (
        hexBotID = "hexbot"
)

type HexBotJob struct{}

func (h HexBotJob) ID() string {
        return hexBotID
}

func (h HexBotJob) Cancel() {
        fmt.Println("Todo: implement this")
}

func (h HexBotJob) Start(done chan JobResult) {
        resp, err := api.CallHexbot()
        res := JobResult{ID: hexBotID, Result: resp, Err: err}
        done <- res
}

func NewHexBotJob() HexBotJob {
        return HexBotJob{}
}

