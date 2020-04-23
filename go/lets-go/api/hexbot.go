package api

import (
        "encoding/json"
        "net/http"
)

const (
        HexbotURL = "https://api.noopschallenge.com/hexbot"
)


type HexbotResponse struct {
        Colors []struct {
                Value string
        }
}

func CallHexbot() (*HexbotResponse, error) {
        resp, err := http.Get(HexbotURL)
        if err != nil {
                return nil, err
        }
        return unmarshalHexbotResponse(resp)
}

func unmarshalHexbotResponse(resp *http.Response) (*HexbotResponse, error) {
        var parsed HexbotResponse
        err := json.NewDecoder(resp.Body).Decode(&parsed)
        return &parsed, err
}
