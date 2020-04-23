package jobs

import (
        "fmt"

        "emilywoods/lets-go/api"
)

const (
        vexBotID = "vexbot"
)


type VexBotJob struct{}

func (v VexBotJob) ID() string {
        return vexBotID
}

func (v VexBotJob) Cancel() {
        fmt.Println("Todo: implement this")
}

func (v VexBotJob) Start(done chan JobResult) {
        resp, err := api.CallVexbot()
        res := JobResult{ID: vexBotID, Result: resp, Err: err}
        done <- res
}

func NewVexBotJob() VexBotJob {
        return VexBotJob{}
}

